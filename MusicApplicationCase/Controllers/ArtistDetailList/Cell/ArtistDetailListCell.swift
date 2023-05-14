//
//  ArtistDetailListCell.swift
//  MusicApplicationCase
//
//  Created by Elif Tum on 14.05.2023.
//

import UIKit

class ArtistDetailListCell: UICollectionViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    
    @IBOutlet weak var albumTitleLabel: UILabel!
    
    @IBOutlet weak var albumReleaseLabel: UILabel!
    
    func configure(artistAlbumListData:ArtistAlbumListData?) {
        cellImageView.kfImage(url: artistAlbumListData?.coverMedium ?? "")
        albumTitleLabel.text = artistAlbumListData?.title ?? ""
        albumReleaseLabel.text = artistAlbumListData?.releaseDate ?? ""
    }
}
