//
//  ArtistListCollectionViewCell.swift
//  MusicApplicationCase
//
//  Created by Elif Tum on 11.05.2023.
//

import UIKit

class ArtistListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private var artistNameLabel: UILabel!
    @IBOutlet private var artistImageView: UIImageView!
    
    func configure (artist: GenresOfArtist?){
        artistNameLabel.text = artist?.name ?? ""
        artistImageView.kfImage(url: artist?.picture_medium ?? "")
    }
    
}
