//
//  HomeView.swift
//  rickAndMortySample
//
//  Created by EdgardVS on 16/10/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        VStack {
            HeaderHome()
            
            CarouselHome(charactersArray: viewModel.charactersArray)
            
            Divider()
          
            
            HomeEpisodes(episodesArray: viewModel.episodesArray)
            
            Spacer()
            
            
            
        }
       
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
