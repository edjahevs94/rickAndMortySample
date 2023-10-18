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
    
//    func getCharacters() async throws -> Character {
//
//       try await withCheckedThrowingContinuation { continuation in
//            guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
//                return
//            }
//
//           let task = URLSession.shared.dataTask(with: url) { data, response, error in
//               guard let data = data, let response = response, error == nil else {
//                   return
//               }
//
//               let decoder = JSONDecoder()
//               do {
//                 let character = try decoder.decode(Character.self, from: try mapResponse(response: (data, response)))
//                   continuation.resume(returning: character)
//               } catch {
//                   continuation.resume(throwing: error)
//               }
//
//
//           }
//           task.resume()
//
//        }
//    }
    //metodo URLSession actual sin necesidad de usar closures
    func getCharacters() async throws -> Character {
        let url = URL(string: "https://rickandmortyapi.com/api/character")
        
        let request = URLRequest(url: url!)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        let fetchedData = try JSONDecoder().decode(Character.self, from: try mapResponse(response: (data, response)))
        
        return fetchedData
        
        
    }
    
    
    
    func getCharacterByUrl(urlString: String) async throws -> Result {
        
        try await withCheckedThrowingContinuation { continuation in
            guard let url = URL(string: urlString) else {
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(Result.self, from: data)
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
                
            }.resume()
        }
        
    }
    
    
}
