import Foundation
import UIKit

protocol SongSearchViewOutput: AnyObject {
    func viewDidSearch(with query: String)
    func viewDidSelectSong(_ song: ITunesSong)
    func viewDidSearchOptionButtonOnTap()
}

@MainActor
class SongSearchPresenter {
    weak var viewInput: (UIViewController & SongSearchViewInput)?
    private let searchService = ITunesSearchService()

    private func requestApps(with query: String) {
        self.searchService.getSongs(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            self.viewInput?.throbber(show: false)
            switch result {
            case let .success(songs):
                guard !songs.isEmpty else {
                    self.viewInput?.showNoResults()
                    return
                }
                self.viewInput?.hideNoResults()
                self.viewInput?.searchResults = songs
            case let .failure(error):
                self.viewInput?.showError(error: error)
            }
        }
    }

    private func openSongDetails(with song: ITunesSong) {
        let songDetailViewController = SongDetailViewController(song: song)
        self.viewInput?.navigationController?.pushViewController(songDetailViewController, animated: true)
    }
}

// Mark: - SearchViewOutput
extension SongSearchPresenter: @preconcurrency SongSearchViewOutput {
    func viewDidSearch(with query: String) {
        self.viewInput?.throbber(show: true)
        self.requestApps(with: query)
    }

    func viewDidSelectSong(_ song: ITunesSong) {
        self.openSongDetails(with: song)
    }

    func viewDidSearchOptionButtonOnTap() {
        let rootVC = SearchViewController()
        rootVC.navigationItem.title = "Search for Apps"
        let navVC = UINavigationController()
        navVC.navigationBar.barTintColor = UIColor.varna
        navVC.navigationBar.isTranslucent = false
        navVC.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navVC.viewControllers = [rootVC]
        self.viewInput?.setWindow(navVC: navVC)
    }
}
