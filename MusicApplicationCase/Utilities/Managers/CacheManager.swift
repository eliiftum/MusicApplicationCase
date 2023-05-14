//
//  CacheManager.swift
//  MusicApplicationCase
//
//  Created by Elif Tum on 14.05.2023.
//

import Foundation
struct CacheManager {
    static let shared = CacheManager()
    
    private let defaults: UserDefaults
    
    private init() {
        defaults = UserDefaults.standard
    }
    
    func saveTrack(_ track: TracksData) {
        var tracks = getTracks()
        if tracks != nil {
            tracks?.append(track)
        }
        else {
            tracks = [track]
        }
        
        if let encoded = try? JSONEncoder().encode(tracks) {
            defaults.set(encoded, forKey: "TracksDataKey")
        }
    }
    
    func getTracks() -> [TracksData]? {
        if let data = defaults.object(forKey: "TracksDataKey") as? Data,
           let tracksData = try? JSONDecoder().decode([TracksData].self, from: data) {
             return tracksData
        }
        return nil
    }
    
    func hasTrackInList(id : Int?) -> Bool {
        let tracks = getTracks()
        let isContain = tracks?.contains(where: {$0.id == id })
        return isContain ?? false
    }
    
    func deleteTrackInList(id : Int?) {
        var tracks = getTracks()
        if let targetIndex = tracks?.firstIndex(where: { $0.id == id }) {
            tracks?.remove(at: targetIndex)
        }
        if let encoded = try? JSONEncoder().encode(tracks) {
            defaults.set(encoded, forKey: "TracksDataKey")
        }
    }
    
    
}
