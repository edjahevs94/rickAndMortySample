//
//  WebServiceCharacter.swift
//  rickAndMortySample
//
//  Created by EdgardVS on 16/10/23.
//

import Foundation


@globalActor struct WebServiceCharacterGlobal {
    static var shared = WebServiceCharacter()
}

actor WebServiceCharacter {
    
    func getCharacters() async throws -> Character {
        
       try await withCheckedThrowingContinuation { continuation in
            guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
                return
            }
           
           let task = URLSession.shared.dataTask(with: url) { data, _, error in
               guard let data = data, error == nil else {
                   return
               }
               
               let decoder = JSONDecoder()
               do {
                 let character = try decoder.decode(Character.self, from: data)
                   continuation.resume(returning: character)
               } catch {
                   continuation.resume(throwing: error)
               }
               
               
           }
           task.resume()
           
        }
        
        
        
        
       
        
        
        
    }
    
    
}
