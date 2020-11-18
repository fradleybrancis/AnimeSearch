//
//  NarutoView.swift
//  AnimeSearch
//
//  Created by Rave BizzDev on 11/18/20.
//

import SwiftUI

struct NarutoView: View {
    @State var animes = [Anime]()
    
    var body: some View {
        List(animes) { anime in
            AnimeRow(anime: anime)
        }
        .onAppear(perform: {
            fetch()
        })
    }
    
    func fetch() {
        let networkCall = NetworkCall()
        networkCall.makeNarutoRequest { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let animeList):
                self.animes.append(contentsOf: animeList)
            }
        }
    }
}
