import UIKit

final class AppSearchModuleBuilder {
    @MainActor static func build() -> (UIViewController & AppSearchViewInput) {
        let router = AppSearchRouter()
        let interactor = AppSearchInteractor()
        let presenter = AppSearchPresenter(interactor: interactor, router: router)
        let viewController = AppSearchViewController(output: presenter)
        presenter.viewInput = viewController
        router.viewController = viewController
        return viewController
    }
}
