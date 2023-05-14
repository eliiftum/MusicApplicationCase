//
//  ArtistDetailHeaderCell.swift
//  MusicApplicationCase
//
//  Created by Elif Tum on 14.05.2023.
//

import UIKit

class ArtistDetailHeaderCell: UICollectionViewCell {
    
    @IBOutlet private var cellHeaderImageView: UIImageView!
    
    func configure(url : String) {
        cellHeaderImageView.kfImage(url: url)
    }
    
}
