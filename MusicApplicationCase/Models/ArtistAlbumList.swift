//
//  ArtistAlbumList.swift
//  MusicApplicationCase
//
//  Created by Elif Tum on 14.05.2023.
//

import Foundation

struct ArtistAlbumList: Codable {
  
    let data: [ArtistAlbumListData]?
    let total: Int?
    let next: String?
    
    init(data: [ArtistAlbumListData]? = nil, total: Int? = nil, next: String? = nil) {
        self.data = data
        self.total = total
        self.next = next
    }
}

struct ArtistAlbumListData: Codable {
    
    let id: Int?
    let title: String?
    let link, cover: String?
    let coverSmall, coverMedium, coverBig, coverXl: String?
    let md5Image: String?
    let genreID, fans: Int?
    let releaseDate: String?
    let recordType: String?
    let tracklist: String?
    let explicitLyrics: Bool?
    let type: String?

    enum CodingKeys: String, CodingKey {
        case id, title, link, cover
        case coverSmall = "cover_small"
        case coverMedium = "cover_medium"
        case coverBig = "cover_big"
        case coverXl = "cover_xl"
        case md5Image = "md5_image"
        case genreID = "genre_id"
        case fans
        case releaseDate = "release_date"
        case recordType = "record_type"
        case tracklist
        case explicitLyrics = "explicit_lyrics"
        case type
    }
    
    init(id: Int? = nil, title: String? = nil, link: String? = nil, cover: String? = nil, coverSmall: String? = nil, coverMedium: String? = nil, coverBig: String? = nil, coverXl: String? = nil, md5Image: String? = nil, genreID: Int? = nil, fans: Int? = nil, releaseDate: String? = nil, recordType: String? = nil, tracklist: String? = nil, explicitLyrics: Bool? = nil, type: String? = nil) {
        self.id = id
        self.title = title
        self.link = link
        self.cover = cover
        self.coverSmall = coverSmall
        self.coverMedium = coverMedium
        self.coverBig = coverBig
        self.coverXl = coverXl
        self.md5Image = md5Image
        self.genreID = genreID
        self.fans = fans
        self.releaseDate = releaseDate
        self.recordType = recordType
        self.tracklist = tracklist
        self.explicitLyrics = explicitLyrics
        self.type = type
    }
}
