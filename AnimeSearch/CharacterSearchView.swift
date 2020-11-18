//
//  CharacterSearchView.swift
//  AnimeSearch
//
//  Created by Rave BizzDev on 11/18/20.
//

import SwiftUI
 
struct CharacterSearchView: View {
    @State var searchText: String = ""
    @State var animeCharacters = [AnimeCharacter]()
 
    var body: some View {
        VStack(alignment: .trailing, spacing: 10) {
            HStack {
                TextField("Search...", text: $searchText)
                    .padding(7)
                    .padding(.horizontal, 25)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal, 10)
                
                Button("Search") {
                    fetch()
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
            
            List(animeCharacters) { animeCharacter in
                CharacterRow(character: animeCharacter)
            }
            
        }
    }
    
    func fetch() {
        let networkCall = NetworkCall(searchQuery: searchText)
        networkCall.makeCharacterRequest { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let characters):
                self.animeCharacters.append(contentsOf: characters)
            }
        }
    }
}


