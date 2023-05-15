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
 
        if self.favorites?.count ?? 0 > 0 {

            self.collectionView.backgroundView = nil

            return self.favorites?.count ?? 0
        }
        else {
            let rect = CGRect(x: 0,
                              y: 0,
                              width: self.collectionView.bounds.size.width,
                              height: self.collectionView.bounds.size.height)
            let noDataLabel: UILabel = UILabel(frame: rect)
            noDataLabel.text = "No favorite tracks yet."
            noDataLabel.textAlignment = .center
            noDataLabel.textColor = UIColor.gray
            noDataLabel.sizeToFit()

            self.collectionView.backgroundView = noDataLabel

            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.width-20, height: 128)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
}
