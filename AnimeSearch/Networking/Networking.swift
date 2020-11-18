//
//  Networking.swift
//  AnimeSearch
//
//  Created by Rave BizzDev on 11/17/20.
//

import Foundation

struct NetworkCall {
    
    var searchQuery: String
    
    init(searchQuery: String = "") {
        self.searchQuery = searchQuery
    }
    
    func makeNarutoRequest(completion: @escaping (Result<[Anime], AnimeRequestError>) -> Void) {
        guard let url = URL(string: "https://api.jikan.moe/v3/search/anime?q=naruto") else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, res, err) in
            guard let data = data else {
                completion(.failure(.networkError))
                return
            }
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AnimeResults.self, from: data)
                let animes = decodedResponse.results
                completion(.success(animes))
            } catch {
                completion(.failure(.failedToDecodeResponse))
            }
        }.resume()
    }
    
    func makeCharacterRequest(completion: @escaping (Result<[AnimeCharacter], AnimeRequestError>) -> Void) {
        guard let url = URL(string: "https://api.jikan.moe/v3/search/character?q=\(searchQuery)") else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, res, err) in
            guard let data = data else {
                completion(.failure(.networkError))
                return
            }
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(CharacterResults.self, from: data)
                let characters = decodedResponse.results
                completion(.success(characters))
            } catch {
                completion(.failure(.failedToDecodeResponse))
            }
        }.resume()
    }
}

enum AnimeRequestError: Error {
    case failedToDecodeResponse
    case networkError
}
