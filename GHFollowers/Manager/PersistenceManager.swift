//
//  PersistenceManager.swift
//  GHFollowers
//
//  Created by Dala  on 7/4/21.
//

import Foundation

enum PersistenceManager {
    static private let defaults = UserDefaults.standard
    
    enum keys {
        static let favorites = "favorites"
    }
    
    static func updateWith(favorite: Follower, actionType: PersistenceActionType, completed: @escaping (GFError?) -> Void ) {
        retreiveFavorites { result in
            switch result {
            
            case .success(let favorites):
                var retreivedFavorites = favorites
                
                switch actionType {
                
                case .add:
                    guard !retreivedFavorites.contains(favorite) else {
                        completed(.alreadyinFavorites)
                        return
                    }
                    
                    retreivedFavorites.append(favorite)
                    break
                    
                case .remove:
                    retreivedFavorites.removeAll { $0.login == favorite.login }
                    break
                }
                
                completed(save(favorites: retreivedFavorites))
               
            case .failure(let error):
                completed(error)
            }
        }
    }
    
    //Anytime you needto save custom data to persist it needs to be encodable / decodable
    static func retreiveFavorites(completed: @escaping (Result<[Follower], GFError>) -> Void) {
        
        guard let favoritesData = defaults.object(forKey: keys.favorites) as? Data else {
            completed(.success([]))
            return
        }

        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToFavortie))
        }
    }
    
    static func save(favorites: [Follower]) -> GFError? {
        
        do {
            let encoder = JSONEncoder()
            let enconderFavorites = try encoder.encode(favorites)
            defaults.setValue(enconderFavorites, forKey: keys.favorites)
            return nil
        } catch {
            return .unableToFavortie
        }
    }
}

enum PersistenceActionType {
    case add
    case remove
}
