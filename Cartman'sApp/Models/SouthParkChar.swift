//
//  SouthParkChar.swift
//  Cartman'sApp
//
//  Created by Александр on 07.12.2021.
//

import Foundation

struct SPPerson: Decodable {
    let data: [CharacterPerson]
}

struct CharacterPerson: Decodable {
    let id: Int
    let name: String
    let age: Int?
    let sex: String
    let religion: String?
    let occupation: String?
    //let episodes: [String]
    
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

struct Episodes: Decodable {
    
}

enum URLS: String {
    case southParkAPI = "https://spapi.dev/api/characters/"
}
