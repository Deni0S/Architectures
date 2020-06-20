//
//  AppSearchModuleBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Денис Баринов on 20.6.20.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

final class AppSearchModuleBuilder {
    static func build() -> (UIViewController & AppSearchViewInput) {
        let router = AppSearchRouter()
        let interactor = AppSearchInteractor()
        let presenter = AppSearchPresenter(interactor: interactor, router: router)
        let viewController = AppSearchViewController(output: presenter)
        presenter.viewInput = viewController
        router.viewController = viewController
        return viewController
    }
}
