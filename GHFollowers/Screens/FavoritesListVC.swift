//
//  FavoritesListVC.swift
//  GHFollowers
//
//  Created by Dala  on 6/29/21.
//

import UIKit

class FavoritesListVC: UIViewController {

    let tableView = UITableView()
    var favorites: [Follower] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavorites()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
        configureTableView()
        getFavorites()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Favorites"

        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.rowHeight = 80
        tableView.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.resuseId)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func getFavorites() {
        PersistenceManager.retreiveFavorites { [weak self] result in
            guard let self = self else { return }
          
            switch result {
            case .success(let favorites):
                self.favorites = favorites
                
                if favorites.isEmpty {
                    self.showEmptyStateView(with: "No favorites, add one on the follower screen", in: self.tableView)
                } else {
                    self.favorites = favorites
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        
                        //In case the empty state gets populated on top of it
                        self.view.bringSubviewToFront(self.tableView)
                    }
                }
                
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok.")
                break
            }
        }
    }
}

extension FavoritesListVC: UITableViewDelegate, UITableViewDataSource {
     
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.resuseId) as! FavoriteCell
        let favortie = favorites[indexPath.row]
        cell.set(favorite: favortie)
        
        return cell
    }
}
