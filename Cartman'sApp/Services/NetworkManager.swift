//
//  NetworkManager.swift
//  Cartman'sApp
//
//  Created by Александр on 07.12.2021.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from url: String?, with complition: @escaping (People) -> Void) {
        guard let stringURL = url else { return }
        guard let url = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            do {
                let southPark = try JSONDecoder().decode(People.self, from: data)
                DispatchQueue.main.async {
                    complition(southPark)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
}
