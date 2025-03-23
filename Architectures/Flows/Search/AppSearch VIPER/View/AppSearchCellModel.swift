import Foundation

struct AppSearchCellModel {
    let title: String
    let subtitle: String?
    let rating: String?
}

final class AppSearchCellModelFactory {

    static func cellModel(from model: ITunesApp) -> AppSearchCellModel {
        return AppSearchCellModel(
            title: model.appName,
            subtitle: model.company,
            rating: model.averageRating.flatMap { "\($0)" })
    }
}
