//
//  SongSearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Денис Баринов on 19.6.20.
//  Copyright © 2020 ekireev. All rights reserved.
//

import Foundation
import UIKit

protocol SongSearchViewInput: class {
    var searchResults: [ITunesSong] { get set }
    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
    func throbber(show: Bool)
    func setWindow(navVC: UIViewController)
}

class SongSearchPresenter {
    weak var viewInput: (UIViewController & SongSearchViewInput)?
    private let searchService = ITunesSearchService()
    
    private func requestApps(with query: String) {
        self.searchService.getSongs(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            self.viewInput?.throbber(show: false)
            result
                .withValue { songs in
                    guard !songs.isEmpty else {
                        self.viewInput?.showNoResults()
                        return
                    }
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchResults = songs
            }
            .withError {
                self.viewInput?.showError(error: $0)
            }
        }
    }
    
    private func openSongDetails(with song: ITunesSong) {
        let songDetailViewController = SongDetailViewController(song: song)
        self.viewInput?.navigationController?.pushViewController(songDetailViewController, animated: true)
    }
}

// Mark: - SearchViewOutput
extension SongSearchPresenter: SongSearchViewOutput {
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
