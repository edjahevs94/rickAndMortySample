//
//  HomeViewModel.swift
//  rickAndMortySample
//
//  Created by EdgardVS on 16/10/23.
//

import Foundation


@MainActor
class HomeViewModel: ObservableObject {
    
    @Published var charactersArray: [HomeCharacter] = []
    
    init() {
        getCharacters()
        getEpisodes()
    }
    
    func getCharacters() {
        Task {
            do {
                let data = try await WebServiceCharacterGlobal.shared.getCharacters()
                for character in data.results {
                    charactersArray.append(HomeCharacter(id: character.id, name: character.name, image: character.image))
                }
                //print(data)
            } catch {
                print(String(describing: error))
            }
        }
    }
    
    func getEpisodes() {
        Task {
            do {
                let data = try await WebServiceEpisodeGlobal.shared.getEpisodes()
                print(data)
            } catch {
                print(String(describing: error))
            }
        }
    }
    
    
}
