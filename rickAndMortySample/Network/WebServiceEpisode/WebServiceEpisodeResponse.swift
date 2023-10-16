//
//  WebServiceEpisodeResponse.swift
//  rickAndMortySample
//
//  Created by EdgardVS on 16/10/23.
//

import Foundation

// MARK: - Episode
struct Episode: Codable {
    let info: InfoEpisode
    let results: [ResultEpisode]
}

// MARK: - Info
struct InfoEpisode: Codable {
    let count, pages: Int
    let next: String
    let prev: String?
}

// MARK: - Result
struct ResultEpisode: Codable {
    let id: Int
    let  airDate: String?
    let name, episode: String
    let characters: [String]
    let url: String
    let created: String
}
