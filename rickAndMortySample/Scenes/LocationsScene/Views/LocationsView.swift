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
        
        VStack {
            HeaderLocation()
            if !viewModel.isLoading {
                List(viewModel.locationsArray, children: \.residents) { location in
                    HStack {
                        AsyncImage(url: URL(string: location.image)) { image in
                            image.resizable()
                                .clipShape(Circle())
                                .frame(width: 70, height: 70)
                        } placeholder: {
                            //ProgressView()
                            //.frame(width: 50, height: 50)
                            Image("placeHolder")
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 70, height: 70)
                        }
                        
                        Text(location.name)
                    }
                }.listStyle(.plain)
            }else {

                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
    }
}
