import Foundation

struct SongCellModel {
    let artist: String
    let track: String?
    let picture: String?
}

final class SongCellModelFactory {

    static func cellModel(from model: ITunesSong) -> SongCellModel {
        return SongCellModel(
            artist: model.trackName,
            track: model.artistName,
            picture: model.artwork)
    }
}
