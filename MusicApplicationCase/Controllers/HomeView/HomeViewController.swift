//
//  ViewController.swift
//  MusicApplicationCase
//
//  Created by Elif Tum on 9.05.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private var collectionView: UICollectionView!
    
    private var genreData: GenreMainModel?
    private var selectedGenre: String?
    
    private var selectedGenreId: Int?
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        initDelegates()
        getData()
    }
    
    private func getData() {
        let url = Constants.baseURL + Constants.genreEndpoint
        NetworkManager.shared.getData(url: url) { (response:Result<GenreMainModel, Error>) in
            switch response {
            case .success(let model):
                DispatchQueue.main.async {
                    self.genreData = model
                    self.collectionView.reloadData()
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    fileprivate func initDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension HomeViewController : UICollectionViewDelegate,
                               UICollectionViewDataSource,
                               UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let genreData = genreData else {
            return 0
        }
        return genreData.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.configure(genres: genreData?.data[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedGenreId = genreData?.data[indexPath.row].id
        selectedGenre = genreData?.data[indexPath.row].name
        //self.present(vc, animated: true)
        performSegue(withIdentifier: "toArtistVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "toArtistVC" {
              let destinationVC = segue.destination as! ArtistListVC
              destinationVC.selectedGenreId = selectedGenreId
              destinationVC.genreName = selectedGenre
          }
      }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 175, height: 150)
    }
}
