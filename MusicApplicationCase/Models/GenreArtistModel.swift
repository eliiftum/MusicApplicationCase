//
//  GenreArtistModel.swift
//  MusicApplicationCase
//
//  Created by Elif Tum on 9.05.2023.
//

import Foundation

struct GenreArtistModel : Codable{
    var data : [GenresOfArtist]
}
struct GenresOfArtist : Codable{
    let id : Int?
    let name : String?
    let picture : String?
    let picture_small : String?
    let picture_medium : String?
    let picture_big : String?
    let picture_xl : String?
    let radio : Bool?
    let tracklist : String?
    let type : String?
}
