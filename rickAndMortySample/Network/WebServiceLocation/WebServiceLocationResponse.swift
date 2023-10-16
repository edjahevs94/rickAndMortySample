//
//  WebServiceÑp.swift
//  rickAndMortySample
//
//  Created by EdgardVS on 16/10/23.
//

import Foundation


// MARK: - Location
struct Location: Codable {
    let info: InfoLocation
    let results: [ResultLocation]
}

// MARK: - Info
struct InfoLocation: Codable {
    let count, pages: Int
    let next: String
    let prev: String?
}

// MARK: - Result
struct ResultLocation: Codable {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
    let url: String
    let created: String
}
