//
//  SouthParkChar.swift
//  Cartman'sApp
//
//  Created by Александр on 07.12.2021.
//

import Foundation

struct People: Decodable {
    let data: [PersonSouthPark]
}

struct PersonSouthPark: Decodable {
    let id: Int
    let name: String
    let age: Int?
    let sex: String
    let religion: String?
    let occupation: String?
    
    var description: String {
        """
        Name: \(name)
        Age: \(age ?? Int.random(in: 5...55))
        Sex: \(sex)
        Religion: \(religion ?? "autism")
        Occupation: \(occupation ?? "---")
        """
    }
}

enum URLS: String {
    case southParkAPI = "https://spapi.dev/api/characters/"
}
