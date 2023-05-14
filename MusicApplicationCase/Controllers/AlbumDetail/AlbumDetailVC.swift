//
//  AlbumDetailVC.swift
//  MusicApplicationCase
//
//  Created by Elif Tum on 14.05.2023.
//

import UIKit

class AlbumDetailVC: UIViewController {
    
    @IBOutlet private var collectionView: UICollectionView!
    var albumId : Int?
    var albumName : String?
    private var artistAlbumModel : ArtistAlbumModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        if let albumName = albumName {
            self.navigationItem.title = albumName
        }
        getAlbumData()
        
        // Do any additional setup after loading the view.
    }
    func getAlbumData(){
        
        if let albumId = albumId {
            let url = Constants.baseURL + Constants.albumEndpoint + Constants.slash + String(albumId)
            NetworkManager.shared.getData(url: url) { (response:Result<ArtistAlbumModel, Error>) in
                switch response {
                case .success(let model):
                    self.artistAlbumModel = model
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
    }
}




extension AlbumDetailVC : UICollectionViewDataSource,
                          UICollectionViewDelegate,
                          UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let artistAlbumModel = artistAlbumModel {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumDetailListCell", for: indexPath) as! AlbumDetailListCell
            cell.configure(track: artistAlbumModel.tracks?.data?[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return artistAlbumModel?.tracks?.data?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
}
