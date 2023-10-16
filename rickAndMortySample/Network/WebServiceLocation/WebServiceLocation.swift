//
//  WebServiceLocation.swift
//  rickAndMortySample
//
//  Created by EdgardVS on 16/10/23.
//

import Foundation

@globalActor struct WebServiceLocationGlobal {
    static var shared = WebServiceLocation()
}


actor WebServiceLocation {
    func getLocations() async throws -> Location{
       try await withCheckedThrowingContinuation { continuation in
           guard let url = URL(string: "https://rickandmortyapi.com/api/location") else {
               return
           }
           let task = URLSession.shared.dataTask(with: url) { data, _, error in
               guard let data = data, error == nil else {
                   return
               }
               
               let decoder = JSONDecoder()
               do {
                   let location = try decoder.decode(Location.self, from: data)
                   continuation.resume(returning: location)
               } catch  {
                   continuation.resume(throwing: error)
               }
               
               
           }
           task.resume()
        }
    }
}
