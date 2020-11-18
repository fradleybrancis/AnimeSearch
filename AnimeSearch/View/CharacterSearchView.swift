//
//  CharacterSearchView.swift
//  AnimeSearch
//
//  Created by Rave BizzDev on 11/18/20.
//

import SwiftUI
 
struct CharacterSearchView: View {
    @ObservedObject var viewModel = CharacterViewModel()
    @State var searchText: String = ""
    
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
                    viewModel.getData(query: searchText)
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
            
            List(viewModel.animeCharacters) { animeCharacter in
                CharacterRow(character: animeCharacter)
            }
            
        }
    }
}


