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
    
    func fetchData(from url: String?, with complition: @escaping (SPPerson) -> Void) {
        guard let stringURL = url else { return }
        guard let url = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            do {
                let southPark = try JSONDecoder().decode(SPPerson.self, from: data)
                DispatchQueue.main.async {
                    complition(southPark)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func fetchCharacter(from url: String?, with complition: @escaping (Character) -> Void) {
        guard let stringURL = url else { return }
        guard let url = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode(Character.self, from: data)
                DispatchQueue.main.async {
                    complition(result)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
