//
//  CarouselHome.swift
//  rickAndMortySample
//
//  Created by EdgardVS on 17/10/23.
//

import SwiftUI

struct CarouselHome: View {
    
    var charactersArray: [HomeCharacter]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(charactersArray) { character in
                    CharacterCell(urlString: character.image, name: character.name)
                }
            }
        }
    }
}

struct CarouselHome_Previews: PreviewProvider {
    static var previews: some View {
        CarouselHome(charactersArray: [HomeCharacter(id: 1, name: "Morty Smith", image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg"), HomeCharacter(id: 1, name: "Morty Smith", image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg"),HomeCharacter(id: 1, name: "Morty Smith Rodriguez", image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg"), HomeCharacter(id: 1, name: "Morty Smith", image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg"), HomeCharacter(id: 1, name: "Morty Smith", image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg"), HomeCharacter(id: 1, name: "Morty Smith", image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg")])
    }
}
