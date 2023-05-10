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
    
    internal init(id: Int? = nil,
                  name: String? = nil,
                  picture: String? = nil,
                  picture_small: String? = nil,
                  picture_medium: String? = nil,
                  picture_big: String? = nil,
                  picture_xl: String? = nil,
                  radio: Bool? = nil,
                  tracklist: String? = nil,
                  type: String? = nil) {
        
        self.id = id
        self.name = name
        self.picture = picture
        self.picture_small = picture_small
        self.picture_medium = picture_medium
        self.picture_big = picture_big
        self.picture_xl = picture_xl
        self.radio = radio
        self.tracklist = tracklist
        self.type = type
    }
}
