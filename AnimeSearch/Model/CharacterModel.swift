//
//  Model.swift
//  AnimeSearch
//
//  Created by Rave BizzDev on 11/17/20.
//

import Foundation

struct CharacterResults: Codable {
    let results: [AnimeCharacter]
}

struct AnimeCharacter: Codable, Identifiable {
    
    enum CodingKeys: String, CodingKey {
        case name, image_url
        case id = "mal_id"
    }
    
    let id: Int
    let name: String
    let image_url: String
}
