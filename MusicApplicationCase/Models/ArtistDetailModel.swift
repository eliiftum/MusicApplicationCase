//
//  GenreArtistDetailModel.swift
//  MusicApplicationCase
//
//  Created by Elif Tum on 9.05.2023.
//

import Foundation

struct ArtistDetailModel : Codable {
    
    let id : Int?
    let name : String?
    let link : String?
    let share : String?
    let picture_small : String?
    let picture_medium : String?
    let picture_big : String?
    let picture_xl : String?
    let nb_album : Int?
    let nb_fan : Int?
    let radio : Bool?
    let tracklist : String?
    let type : String?
    
    internal init(id: Int? = nil,
                  name: String? = nil,
                  link: String? = nil,
                  share: String? = nil,
                  picture_small: String? = nil,
                  picture_medium: String? = nil,
                  picture_big: String? = nil,
                  picture_xl: String? = nil,
                  nb_album: Int? = nil,
                  nb_fan: Int? = nil,
                  radio: Bool? = nil,
                  tracklist: String? = nil,
                  type: String? = nil) {
        
        self.id = id
        self.name = name
        self.link = link
        self.share = share
        self.picture_small = picture_small
        self.picture_medium = picture_medium
        self.picture_big = picture_big
        self.picture_xl = picture_xl
        self.nb_album = nb_album
        self.nb_fan = nb_fan
        self.radio = radio
        self.tracklist = tracklist
        self.type = type
    }
}

