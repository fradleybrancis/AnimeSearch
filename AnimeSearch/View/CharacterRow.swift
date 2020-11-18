//
//  CharacterRow.swift
//  AnimeSearch
//
//  Created by Rave BizzDev on 11/18/20.
//

import SwiftUI

struct CharacterRow: View {
    var character: AnimeCharacter
    
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            RemoteImage(url: character.image_url)
                .aspectRatio(contentMode: .fit)
                .frame(width: 125, height: 125)
            Text(character.name)
                .font(.body)
        }
    }
}
