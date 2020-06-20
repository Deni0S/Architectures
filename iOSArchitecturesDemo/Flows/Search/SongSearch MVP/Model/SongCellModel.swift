//
//  SongCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Денис Баринов on 19.6.20.
//  Copyright © 2020 ekireev. All rights reserved.
//

import Foundation

struct SongCellModel {
    let artist: String
    let track: String?
    let picture: String?
}

final class SongCellModelFactory {
    
    static func cellModel(from model: ITunesSong) -> SongCellModel {
        return SongCellModel(artist: model.trackName,
                             track: model.artistName,
                             picture: model.artwork)
    }
}
