//
//  FavoriteVCViewController.swift
//  MusicApplicationCase
//
//  Created by Elif Tum on 10.05.2023.
//

import UIKit

class FavoriteVC: UIViewController {
    var favorites: [TracksData]? {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.collectionView.setNeedsLayout()
                self.collectionView.layoutIfNeeded()
            }
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favorites = CacheManager.shared.getTracks()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    


}

extension FavoriteVC : UICollectionViewDataSource,
                          UICollectionViewDelegate,
                          UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let favorites = favorites {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesCollectionViewCell", for: indexPath) as! FavoritesCollectionViewCell
            cell.configure(track: favorites[indexPath.row])
            cell.clickedFavoriteButton = {
                self.favorites = CacheManager.shared.getTracks()
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favorites?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.width-20, height: 128)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
}
