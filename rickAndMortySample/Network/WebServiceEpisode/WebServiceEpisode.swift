//
//  WebServiceEpisode.swift
//  rickAndMortySample
//
//  Created by EdgardVS on 16/10/23.
//

import Foundation

@globalActor struct WebServiceEpisodeGlobal {
    static var shared = WebServiceEpisode()
}


actor WebServiceEpisode {
    
    func getEpisodes() async throws -> Episode{
        try await withCheckedThrowingContinuation { continuation in
            guard let url = URL(string: "https://rickandmortyapi.com/api/episode") else {
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data , error == nil else {
                    return
                }
                
                let decoder = JSONDecoder()
                do {
                    let episode = try decoder.decode(Episode.self, from: data)
                    continuation.resume(returning: episode)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
            task.resume()
        }
    }
    
    
}
