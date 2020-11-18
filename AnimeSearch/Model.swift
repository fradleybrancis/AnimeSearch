//
//  Model.swift
//  AnimeSearch
//
//  Created by Rave BizzDev on 11/17/20.
//

import Foundation

struct AnimeResults: Codable {
    let results: [Anime]
}

struct Anime: Codable, Identifiable {
    
    enum CodingKeys: String, CodingKey {
        case title, image_url, synopsis, episodes
        case id = "mal_id"
    }
    
    let id: Int
    let title: String
    let image_url: String
    let synopsis: String
    let episodes: Int
}

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
