//
//  SoundManager.swift
//  MusicApplicationCase
//
//  Created by Elif Tum on 14.05.2023.
//

import Foundation
import AVFoundation

class SoundManager  {
    static let shared = SoundManager()
    var player: AVPlayer?
    
    func playMP3FromURL(url: URL) {
        self.player = AVPlayer(url: url)
        self.player?.play()
    }
}
