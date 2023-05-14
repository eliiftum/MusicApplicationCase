//
//  HomeCollectionViewCell.swift
//  MusicApplicationCase
//
//  Created by Elif Tum on 10.05.2023.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private var categoryTitleLabel: UILabel!
    @IBOutlet private var categoryImageView: UIImageView!
    
    func configure (genres: Genres?){
        categoryTitleLabel.text = genres?.name ?? ""
        categoryImageView.kfImage(url: genres?.picture_medium ?? "")
    }
    
}
