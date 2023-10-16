//
//  LocationsViewModel.swift
//  rickAndMortySample
//
//  Created by EdgardVS on 16/10/23.
//

import Foundation


class LocationsViewModel: ObservableObject {
    
    init() {
        getLocations()
    }
    
    func getLocations() {
        Task {
            do {
                let data = try await WebServiceLocationGlobal.shared.getLocations()
                
            } catch {
                print(String(describing: error))
            }
        }
    }
    
}
