//
//  Location.swift
//  rickAndMortySample
//
//  Created by EdgardVS on 16/10/23.
//

import Foundation

struct LocationModel: Identifiable {
    let id: Int
    let name: String
    let type: String
    let image: String
    var residents: [LocationModel]?
}


