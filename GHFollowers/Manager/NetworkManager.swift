//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Dala  on 7/1/21.
//

import Foundation
 
class NetworkManager {
    static let shared = NetworkManager()
    
    let baseURL = "https://api.github.com/users/"
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completed: @escaping ([Follower]?, String?) -> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(nil,"This username created an invalid request")
            return
            
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(nil, "unable to complete request, Please check internet connection")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "Invalid response from the server, please try again")
                return
            }
            
            guard let data = data else {
                completed(nil, "The data received from the server was invalid please try again")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers, nil)
            } catch {
                completed(nil, "The data received from the server was invalid please try again")
            }
        }
        task.resume()
    }
}
