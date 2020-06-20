//
//  AppSearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Денис Баринов on 20.6.20.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

protocol AppSearchViewInput: class {
    var searchResults: [ITunesApp] { get set }
    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
    func throbber(show: Bool)
    func setWindow(navVC: UIViewController)
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
    
    private func openSongDetails(with app: ITunesApp) {
        let appDetailViewController = AppDetailViewController(app: app)
        self.viewInput?.navigationController?.pushViewController(appDetailViewController, animated: true)
    }
}

// Mark: - SearchViewOutput
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
