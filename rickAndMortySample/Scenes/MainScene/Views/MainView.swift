//
//  MainView.swift
//  rickAndMortySample
//
//  Created by EdgardVS on 16/10/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            LocationsView()
                .tabItem {
                    Label("Locations", systemImage: "location")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
