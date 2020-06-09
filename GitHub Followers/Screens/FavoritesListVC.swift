//
//  FavoritesListVC.swift
//  GitHub Followers
//
//  Created by Nickson Poon on 5/14/20.
//  Copyright © 2020 Nickson Poon. All rights reserved.
//

import UIKit

class FavoritesListVC: UIViewController {
    
    let tableView = UITableView()
    var favorites: [Follower] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        configureViewController()
        configureTableView()
    }
    
    // Constantly refreshing our favorites screen. In case user has empty state, adds a favorite and returns. ViewDidLoad() will not be called twice
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavorites()
    }
    
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.rowHeight = 80
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.reuseID)
        
    }
    
    func getFavorites() {
        
        PersistenceManager.retrieveFavorites { [weak self ] (result) in
            guard let self = self else { return }
            switch result {
                
            case .success(let favorites):
                if favorites.isEmpty {
                    self.showEmptyStateView(with: "You have no favorite users yet. \n Add one on the follower screen!", in: self.view)
                } else {
                    self.favorites = favorites
                    DispatchQueue.main.async { // Reloading data on tableview, must do it on main thread
                        self.tableView.reloadData()
                        self.view.bringSubviewToFront(self.tableView) // Edge Case: Empty state gets populated in front of tableview
                    }
                }
                
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something Went Wrong", message: error.rawValue, buttonTitle: "Ok")
            }
        }
        
    }
}

extension FavoritesListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.reuseID) as! FavoriteCell
        let favorite = favorites[indexPath.row]
        cell.setFavorite(favorite: favorite)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favorite = favorites[indexPath.row]
        let destVC = FollowerListVC()
        destVC.username = favorite.login
        destVC.title = favorite.login
        
        navigationController?.pushViewController(destVC, animated: true)
    }
    
    
    // swipe to delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
         let favorite = favorites[indexPath.row]
        favorites.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        
        PersistenceManager.updateWith(favorite: favorite, actionType: .remove) { [weak self] (error) in
            guard let self = self else { return }
            guard let error = error else { return }
            self.presentGFAlertOnMainThread(title: "Something Went Wrong", message: error.rawValue, buttonTitle: "Ok")

        }
        
    }
    
    
}
