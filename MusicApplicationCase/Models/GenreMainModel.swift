//
//  GenreMainModel.swift
//  MusicApplicationCase
//
//  Created by Elif Tum on 9.05.2023.
//

import Foundation


struct GenreMainModel : Codable {
    var data : [Genres]
}

struct Genres : Codable {
    let id : Int?
    let name : String?
    let picture: String?
    let picture_small: String?
    let picture_medium : String?
    let picture_big : String?
    let picture_xl : String?
    let type : String?
}

