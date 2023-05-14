//
//  FavoritesCollectionViewCell.swift
//  MusicApplicationCase
//
//  Created by Elif Tum on 14.05.2023.
//

import UIKit

class FavoritesCollectionViewCell: UICollectionViewCell {
    private var track : TracksData?
    var clickedFavoriteButton : (()->())?
    
    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var trackDurationLbl: UILabel!
    @IBOutlet weak var trackNameLbl: UILabel!
    @IBOutlet weak var trackImageView: UIImageView!
    
    
    
    func configure(track: TracksData?) {
        self.track = track
        trackImageView.kfImage(url: track?.album?.coverMedium ?? "")
        trackNameLbl.text = track?.title ?? ""
        trackDurationLbl.text = String(track?.duration ?? 0)
        controlHasFavorite()
        addGestureForFavorite()
        addGestureForSong()
    }
    
    private func controlHasFavorite(){
        let hasTrackInList =  CacheManager.shared.hasTrackInList(id: track?.id)
        if hasTrackInList {
            favoriteImageView.image = UIImage(systemName: "heart.fill")
        }
        else {
            favoriteImageView.image = UIImage(systemName: "heart")
        }
    }
    
    private func addGestureForFavorite(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(addFavorite))
        favoriteImageView.addGestureRecognizer(gesture)
        favoriteImageView.isUserInteractionEnabled = true
    }
    
    private func addGestureForSong(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(playPreview))
        trackDurationLbl.addGestureRecognizer(gesture)
        trackNameLbl.addGestureRecognizer(gesture)
        trackImageView.addGestureRecognizer(gesture)
        
        trackDurationLbl.isUserInteractionEnabled = true
        trackNameLbl.isUserInteractionEnabled = true
        trackImageView.isUserInteractionEnabled = true
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
            clickedFavoriteButton?()
        }
    }
    
    @objc private func playPreview() {
        if let url = URL(string: track?.preview ?? "") {
            SoundManager.shared.playMP3FromURL(url: url)
        }
    }
}
