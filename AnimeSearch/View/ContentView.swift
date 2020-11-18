//
//  ContentView.swift
//  AnimeSearch
//
//  Created by Rave BizzDev on 11/17/20.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            NarutoView()
                .tabItem {
                    Text("Naruto")
                    Image(systemName: "list.dash")
                }
            
            CharacterSearchView()
                .tabItem {
                    Text("Character Search")
                    Image(systemName: "magnifyingglass")
                }
        }
    }
}
