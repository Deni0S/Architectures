//
//  AppSearchRouter.swift
//  iOSArchitecturesDemo
//
//  Created by Денис Баринов on 20.6.20.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

protocol AppSearchRouterInput {
    func openDetails(for app: ITunesApp)
    func openAppInItunes(_ app: ITunesApp)
    func viewDidSearchOptionButtonOnTap() -> UIViewController
}

final class AppSearchRouter: AppSearchRouterInput {
    weak var viewController: UIViewController?
    
    func openDetails(for app: ITunesApp) {
        let appDetailViewController = AppDetailViewController(app: app)
        self.viewController?.navigationController?.pushViewController(appDetailViewController, animated: true)
    }
    
    func openAppInItunes(_ app: ITunesApp) {
        guard let urlString = app.appUrl, let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func viewDidSearchOptionButtonOnTap() -> UIViewController {
        let rootVC = SongSearchModuleBuilder.build()
        rootVC.navigationItem.title = "Search for Songs"
        let navVC = UINavigationController()
        navVC.navigationBar.barTintColor = UIColor.varna
        navVC.navigationBar.isTranslucent = false
        navVC.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navVC.viewControllers = [rootVC]
        return navVC
    }
}
