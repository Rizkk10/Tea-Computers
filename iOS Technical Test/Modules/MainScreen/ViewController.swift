//
//  ViewController.swift
//  iOS Technical Test
//
//  Created by Rezk on 18/06/2023.
//

import UIKit

protocol MainViewProtocol : AnyObject {
    
    func renderCollection()
}


class ViewController: UIViewController  {
    
    @IBOutlet weak var repoCollection: UICollectionView!
    var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ViewModel()
        viewModel.bindResultToHomeView = { [weak self] in
            DispatchQueue.main.async {
                self?.renderCollection()
            }
        }
        viewModel.getRepositories()
        
    }

}

extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.repositories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        let repo = viewModel.repositories[indexPath.item]
        cell.configCell(repo: repo)
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 2 - 10
        let height = collectionView.bounds.height / 3.8
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
}


extension ViewController : MainViewProtocol {
    
    func renderCollection() {
        self.repoCollection.reloadData()
    }
}
