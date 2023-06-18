//
//  CollectionViewCell.swift
//  iOS Technical Test
//
//  Created by Rezk on 18/06/2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var repoName: UILabel!
    
    @IBOutlet weak var reroDescription: UITextView!
    
    func configCell(repo: Repositories){
        repoName.text = repo.name
        reroDescription.text = repo.description
        reroDescription.isEditable = false
        self.layer.cornerRadius = 25
        self.layer.masksToBounds = true
        self.contentView.layer.masksToBounds = true
        

        
    }
    
}
