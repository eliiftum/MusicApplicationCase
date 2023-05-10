//
//  GenreArtistAlbumModel.swift
//  MusicApplicationCase
//
//  Created by Elif Tum on 9.05.2023.
//

import Foundation

struct GenreArtistAlbumModel : Codable {
    
    let id : Int?
    let title : String?
    let upc : String?
    let link : String?
    let share : String?
    let cover : String?
    let cover_small : String?
    let cover_medium : String?
    let cover_big : String?
    let cover_xl : String?
    let md5_image : String?
    let genre_id : Int?
    let genres : GenresData
    
    internal init(id: Int? = nil,
                  title: String? = nil,
                  upc: String? = nil,
                  link: String? = nil,
                  share: String? = nil,
                  cover: String? = nil,
                  cover_small: String? = nil,
                  cover_medium: String? = nil,
                  cover_big: String? = nil,
                  cover_xl: String? = nil,
                  md5_image: String? = nil,
                  genre_id: Int? = nil,
                  genres: GenresData) {
        
        self.id = id
        self.title = title
        self.upc = upc
        self.link = link
        self.share = share
        self.cover = cover
        self.cover_small = cover_small
        self.cover_medium = cover_medium
        self.cover_big = cover_big
        self.cover_xl = cover_xl
        self.md5_image = md5_image
        self.genre_id = genre_id
        self.genres = genres
    }
}

struct GenresData : Codable {
    let data : [AlbumOfData]
}

struct AlbumOfData : Codable {
    
    let id : Int?
    let name : String?
    let picture : String?
    let type : String?
    
    internal init(id: Int? = nil,
                  name: String? = nil,
                  picture: String? = nil,
                  type: String? = nil) {
        
        self.id = id
        self.name = name
        self.picture = picture
        self.type = type
    }
}

