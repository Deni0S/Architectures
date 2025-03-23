import Alamofire

protocol AppSearchInteractorInput {
    func requestApps(with query: String, complition: @escaping (Result<[ITunesApp], Error>) -> Void)
}

final class AppSearchInteractor {
    private let searchService = ITunesSearchService()
}

extension AppSearchInteractor: AppSearchInteractorInput {
    func requestApps(with query: String, complition: @escaping (Result<[ITunesApp], Error>) -> Void) {
        self.searchService.getApps(forQuery: query, then: complition)
    }
}
