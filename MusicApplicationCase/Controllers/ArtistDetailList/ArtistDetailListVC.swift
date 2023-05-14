//
//  ArtistDetailListVC.swift
//  MusicApplicationCase
//
//  Created by Elif Tum on 11.05.2023.
//

import UIKit

class ArtistDetailListVC: UIViewController {
    var artistId : Int?
    private var genreArtistDetailModel : ArtistDetailModel?
    private var artistAlbumList : ArtistAlbumList?
    private var selectedAlbumId : Int?
    private var selectedAlbumName: String?

    @IBOutlet private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        getArtistDetail()
        

        // Do any additional setup after loading the view.
    }
    
    
    func getArtistDetail() {
        if let artistId = artistId {
            let url = Constants.baseURL + Constants.artistEndpoint + Constants.slash + String(artistId)
            NetworkManager.shared.getData(url: url) { (response:Result<ArtistDetailModel, Error>) in
                switch response {
                case .success(let model):
                    
                    self.genreArtistDetailModel = model
                    DispatchQueue.main.async {
                        self.navigationItem.title = self.genreArtistDetailModel?.name ?? ""
                    }
                    self.getArtistAlbums()
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
    }
    
    func getArtistAlbums() {
        if let artistId = artistId {
            let url = Constants.baseURL + Constants.artistEndpoint + Constants.slash + String(artistId) + Constants.slash + Constants.albumsEndpoint
            NetworkManager.shared.getData(url: url) { (response:Result<ArtistAlbumList, Error>) in
                switch response {
                case .success(let model):
                    self.artistAlbumList = model
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

extension ArtistDetailListVC : UICollectionViewDataSource,
                               UICollectionViewDelegate,
                               UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let artistAlbumList, let genreArtistDetailModel {
            if indexPath.section == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArtistDetailHeaderCell", for: indexPath) as! ArtistDetailHeaderCell
                cell.configure(url: genreArtistDetailModel.picture_medium ?? "")
                return cell
            }
            else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArtistDetailListCell", for: indexPath) as! ArtistDetailListCell
                cell.configure(artistAlbumListData: artistAlbumList.data?[indexPath.row])
                return cell
            }
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let artistAlbumList, let genreArtistDetailModel {
            if section == 0 {
                return 1
            }
            return artistAlbumList.data?.count ?? 0
        }
       
        return 0
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: UIScreen.width, height: 300)
        }
        return CGSize(width: UIScreen.width, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            self.selectedAlbumId = artistAlbumList?.data?[indexPath.row].id
            self.selectedAlbumName = artistAlbumList?.data?[indexPath.row].title
            performSegue(withIdentifier: "toAlbumDetail", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "toAlbumDetail" {
              let destinationVC = segue.destination as! AlbumDetailVC
              destinationVC.albumId = selectedAlbumId
              destinationVC.albumName = selectedAlbumName
          }
      }
    
}
