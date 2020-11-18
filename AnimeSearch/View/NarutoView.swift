//
//  NarutoView.swift
//  AnimeSearch
//
//  Created by Rave BizzDev on 11/18/20.
//

import SwiftUI

struct NarutoView: View {
    @ObservedObject var viewModel: NarutoViewModel = {
        let vm = NarutoViewModel()
        vm.getData()
        return vm
    }()
    
    var body: some View {
        List(viewModel.animes) { anime in
            AnimeRow(anime: anime)
        }
    }
}
