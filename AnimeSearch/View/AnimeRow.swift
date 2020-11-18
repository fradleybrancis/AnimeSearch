//
//  AnimeRow.swift
//  AnimeSearch
//
//  Created by Rave BizzDev on 11/17/20.
//

import SwiftUI

struct AnimeRow: View {
    var anime: Anime
    
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            RemoteImage(url: anime.image_url)
                .aspectRatio(contentMode: .fit)
                .frame(width: 125, height: 125)
            VStack(alignment: .leading, spacing: 10) {
                Text(anime.title)
                    .font(.subheadline)
                Text("Episodes: \(anime.episodes)")
                    .font(.footnote)
                    .foregroundColor(.red)
                Text(anime.synopsis)
                    .font(.caption)
            }
        }
    }
}
