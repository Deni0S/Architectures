//
//  SongSearchModuleBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Денис Баринов on 20.6.20.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

final class SongSearchModuleBuilder {
    static func build() -> (UIViewController & SongSearchViewInput) {
        let presenter = SongSearchPresenter()
        let viewController = SongSearchViewController(presenter: presenter)
        presenter.viewInput = viewController
        return viewController
    }
}
