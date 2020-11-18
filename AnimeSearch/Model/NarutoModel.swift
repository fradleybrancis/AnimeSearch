//
//  NarutoModel.swift
//  AnimeSearch
//
//  Created by Rave BizzDev on 11/18/20.
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
