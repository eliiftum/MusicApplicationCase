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

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let genreData = genreData else {
            return 0
        }
        return genreData.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        return cell
    }
}
