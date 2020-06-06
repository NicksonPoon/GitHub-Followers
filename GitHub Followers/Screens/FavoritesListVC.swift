//
//  FavoritesListVC.swift
//  GitHub Followers
//
//  Created by Nickson Poon on 5/14/20.
//  Copyright © 2020 Nickson Poon. All rights reserved.
//

import UIKit

class FavoritesListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        PersistenceManager.retrieveFavorites { (result) in
            switch result {
                
            case .success(let favorites):
                print(favorites)
            case .failure(let error):
                break
            }
        }
    }

}
