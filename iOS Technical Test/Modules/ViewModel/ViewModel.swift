//
//  ViewModel.swift
//  iOS Technical Test
//
//  Created by Rezk on 18/06/2023.
//

import Foundation
import UIKit

class ViewModel {
    var bindResultToHomeView: (() -> Void) = {}
    var repositories: [Repositories] = [] {
        didSet {
            bindResultToHomeView()
        }
    }
    
    func getRepositories() {
        let apiLink = "https://api.github.com/orgs/square/repos"
        NetworkManager.fetchData(apiLink:apiLink) { [weak self] data in
            self?.repositories = data ?? []
            self?.bindResultToHomeView()
        }
    }
}
