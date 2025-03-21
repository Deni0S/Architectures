import Foundation

struct AppCellModel {
    let title: String
    let subtitle: String?
    let rating: String?
}

final class AppCellModelFactory {

    static func cellModel(from model: ITunesApp) -> AppCellModel {
        return AppCellModel(
            title: model.appName,
            subtitle: model.company,
            rating: model.averageRating.flatMap { "\($0)" })
    }
}
