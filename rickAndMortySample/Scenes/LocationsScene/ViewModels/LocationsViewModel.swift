//
//  LocationsViewModel.swift
//  rickAndMortySample
//
//  Created by EdgardVS on 16/10/23.
//

import Foundation

@MainActor
class LocationsViewModel: ObservableObject {
    
    @Published var locationsArray: [LocationModel] = []
    @Published var isLoading = true
    
    init() {
        getLocations()
    }
    
    func getLocations() {
        Task {
            do {
                
                print("is loading \(isLoading)")
                let data = try await WebServiceLocationGlobal.shared.getLocations()
                var tempLocationsArray: [LocationModel] = []
                
                for location in data.results {
                    
                    var tempResidentArray: [LocationModel] = []
                    
                    for residentUrl in location.residents {
                        
                        let resident = await getCharactersByUrl(urlString: residentUrl)
                        guard let resident = resident else {
                            continue
                        }
                        tempResidentArray.append(resident)
                    }
                    tempLocationsArray.append(LocationModel(id: location.id, name: location.name, type: location.type, image: " ", residents: tempResidentArray))
                }
                isLoading = false
                print("is loading \(isLoading)")
                locationsArray = tempLocationsArray
                
            } catch {
                print(String(describing: error))
            }
        }
    }
    
    func getCharactersByUrl(urlString: String) async -> LocationModel?{
        
            do {
                let data = try await WebServiceCharacterGlobal.shared.getCharacterByUrl(urlString: urlString)
                let resident = LocationModel(id: data.id, name: data.name, type: data.type, image: data.image)
                return resident
            } catch {
                print(String(describing: error))
                return nil
            }
       
    }
    
}
