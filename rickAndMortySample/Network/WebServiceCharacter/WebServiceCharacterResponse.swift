//
//  WebServiceCharacterRespone.swift
//  rickAndMortySample
//
//  Created by EdgardVS on 16/10/23.
//

import Foundation


// MARK: - Character
struct Character: Codable {
    let info: Info
    let results: [Result]
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int
    let next: String
    let prev: String?
}

// MARK: - Result
struct Result: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin, location: CharacterLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

//enum Gender: String, Codable {
//    case female
//    case male
//    case unknown
//}

// MARK: - Location
struct CharacterLocation: Codable {
    let name: String
    let url: String
}

//enum Species: String, Codable {
//    case alien
//    case human
//}

//enum Status: String, Codable {
//    case alive
//    case dead
//    case unknown
//}
