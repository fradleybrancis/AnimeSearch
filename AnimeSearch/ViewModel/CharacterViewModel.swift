//
//  CharacterViewModel.swift
//  AnimeSearch
//
//  Created by Rave BizzDev on 11/18/20.
//

import SwiftUI

class CharacterViewModel: ObservableObject {
    @Published private var model: [AnimeCharacter] = []
    
    var animeCharacters: [AnimeCharacter] {
        return model
    }
    
    func getData(query: String) {
        let networkCall = NetworkCall(searchQuery: query)
        
        networkCall.makeCharacterRequest { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let characterList):
                DispatchQueue.main.async {
                    self.model = characterList
                }
            }
        }
    }
    
}

