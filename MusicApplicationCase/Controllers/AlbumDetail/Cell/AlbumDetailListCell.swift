//
//  AlbumDetailListCell.swift
//  MusicApplicationCase
//
//  Created by Elif Tum on 14.05.2023.
//

import UIKit

class AlbumDetailListCell: UICollectionViewCell {
    
    private var track : TracksData?
    
    @IBOutlet weak var favoriteImage: UIImageView!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var trackImageview: UIImageView!
    @IBOutlet weak var trackTitleLabel: UILabel!
    
    func configure(track: TracksData?) {
        self.track = track
        trackImageview.kfImage(url: track?.album?.coverMedium ?? "")
        trackTitleLabel.text = track?.title ?? ""
        durationLabel.text = String(track?.duration ?? 0)
        controlHasFavorite()
        addGestureForFavorite()
        addGestureForSong()
    }
    
    
    private func controlHasFavorite(){
        let hasTrackInList =  CacheManager.shared.hasTrackInList(id: track?.id)
        if hasTrackInList {
            favoriteImage.image = UIImage(systemName: "heart.fill")
        }
        else {
            favoriteImage.image = UIImage(systemName: "heart")
        }
    }
    
    private func addGestureForFavorite(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(addFavorite))
        favoriteImage.addGestureRecognizer(gesture)
        favoriteImage.isUserInteractionEnabled = true
    }
    
    private func addGestureForSong(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(playPreview))
        durationLabel.addGestureRecognizer(gesture)
        trackTitleLabel.addGestureRecognizer(gesture)
        trackImageview.addGestureRecognizer(gesture)
        
        durationLabel.isUserInteractionEnabled = true
        trackTitleLabel.isUserInteractionEnabled = true
        trackImageview.isUserInteractionEnabled = true
    }
    
    
    @objc private func addFavorite() {
        let hasTrackInList =  CacheManager.shared.hasTrackInList(id: track?.id)
        if let track = track {
            if !hasTrackInList {
                CacheManager.shared.saveTrack(track)
            }
            else {
                CacheManager.shared.deleteTrackInList(id: track.id)
            }
            controlHasFavorite()
        }
    }
    
    @objc private func playPreview() {
        if let url = URL(string: track?.preview ?? "") {
            SoundManager.shared.playMP3FromURL(url: url)
        }
    }
    
}
