//
//  ArtistListVCViewController.swift
//  MusicApplicationCase
//
//  Created by Elif Tum on 11.05.2023.
//

import UIKit

class ArtistListVC: UIViewController {
    
    
    @IBOutlet weak var collectionView2: UICollectionView!
    
    var selectedGenreId : Int?
    var selectedArtistId : Int?
    var genreName : String?
    var genreArtistModel : GenreArtistListModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print( "GHOME", collectionView2.frame)
        
        
        collectionView2.delegate = self
        collectionView2.dataSource = self
        if let genreName = genreName {
            self.navigationItem.title = genreName
        }
        getData()
    }
    
    private func getData() {
        if let selectedGenreId = selectedGenreId {
            let url = Constants.baseURL + Constants.genreEndpoint + Constants.slash + String(selectedGenreId) + Constants.slash + Constants.artistsEndpoint
            
            NetworkManager.shared.getData(url: url) { (response:Result<GenreArtistListModel, Error>) in
                switch response {
                case .success(let model):
                    DispatchQueue.main.async {
                        self.genreArtistModel = model
                        self.collectionView2.reloadData()
                    }
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
                
            }
        }
    }
    
}

extension ArtistListVC : UICollectionViewDelegate,
                         UICollectionViewDataSource,
                         UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArtistListCollectionViewCell", for: indexPath) as! ArtistListCollectionViewCell
        cell.configure(artist: genreArtistModel?.data[indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let genreArtistModel = genreArtistModel else {
            return 0
        }
        return genreArtistModel.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 175, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            self.selectedArtistId = genreArtistModel?.data[indexPath.row].id
            performSegue(withIdentifier: "toArtistDetail", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "toArtistDetail" {
              let destinationVC = segue.destination as! ArtistDetailListVC
              destinationVC.artistId = selectedArtistId
          }
      }
    
}
