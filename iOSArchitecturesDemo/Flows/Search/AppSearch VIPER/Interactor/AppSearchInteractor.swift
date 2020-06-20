//
//  AppSearchInteractor .swift
//  iOSArchitecturesDemo
//
//  Created by Денис Баринов on 20.6.20.
//  Copyright © 2020 ekireev. All rights reserved.
//

import Alamofire

protocol AppSearchInteractorInput {
    
    func requestApps(with query: String, complition: @escaping (Result<[ITunesApp]>) -> Void)
}

final class AppSearchInteractor: AppSearchInteractorInput {
    private let searchService = ITunesSearchService()
    
    func requestApps(with query: String, complition: @escaping (Result<[ITunesApp]>) -> Void) {
        self.searchService.getApps(forQuery: query, then: complition)
    }
}
