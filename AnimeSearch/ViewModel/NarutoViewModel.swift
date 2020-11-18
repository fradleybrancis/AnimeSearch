//
//  NarutoViewModel.swift
//  AnimeSearch
//
//  Created by Rave BizzDev on 11/18/20.
//
import SwiftUI

class NarutoViewModel: ObservableObject {
    @Published private var model: [Anime] = []
    
    var animes: [Anime] {
        return model
    }
    
    func getData() {
        let networkCall = NetworkCall()
        
        networkCall.makeNarutoRequest { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let animeList):
                DispatchQueue.main.async {
                    self.model = animeList
                }
            }
        }
    }
    
}
