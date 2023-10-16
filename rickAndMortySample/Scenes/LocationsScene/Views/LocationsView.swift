//
//  LocationsView.swift
//  rickAndMortySample
//
//  Created by EdgardVS on 16/10/23.
//

import SwiftUI

struct LocationsView: View {
    
    @StateObject var viewModel = LocationsViewModel()
    
    var body: some View {
        Text("Locations")
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
    }
}
