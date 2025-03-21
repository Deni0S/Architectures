import UIKit

protocol AppSearchViewOutput: AnyObject {
    func viewDidSearch(with query: String)
    func viewDidSelectApp(_ app: ITunesApp)
    func viewDidSearchOptionButtonOnTap()
}

class AppSearchPresenter {
    weak var viewInput: (UIViewController & AppSearchViewInput)?
    let interactor: AppSearchInteractorInput
    let router: AppSearchRouterInput

    init(interactor: AppSearchInteractorInput, router: AppSearchRouterInput) {
        self.interactor = interactor
        self.router = router
    }

    private func requestApps(with query: String) {
        self.interactor.requestApps(with: query) { [weak self] result in
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

    @MainActor private func openSongDetails(with app: ITunesApp) {
        let appDetailViewController = AppDetailViewController(app: app)
        self.viewInput?.navigationController?.pushViewController(appDetailViewController, animated: true)
    }
}

// MARK: - SearchViewOutput
extension AppSearchPresenter: AppSearchViewOutput {

    func viewDidSearch(with query: String) {
        self.viewInput?.throbber(show: true)
        self.requestApps(with: query)
    }

    func viewDidSelectApp(_ app: ITunesApp) {
        self.router.openDetails(for: app)
    }

    func viewDidSearchOptionButtonOnTap() {
        self.viewInput?.setWindow(navVC: self.router.viewDidSearchOptionButtonOnTap())
    }
}
