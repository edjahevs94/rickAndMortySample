//
//  HomeEpisodes.swift
//  rickAndMortySample
//
//  Created by EdgardVS on 17/10/23.
//

import SwiftUI

struct HomeEpisodes: View {
    
    var episodesArray: [HomeEpisode]
    
    var body: some View {
        List(episodesArray) { episode in
            HStack {
                AsyncImage(url: URL(string: "ss")) { image in
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
                
                Text(episode.name)
            }
        }.listStyle(.plain)
    }
}

struct HomeEpisodes_Previews: PreviewProvider {
    static var previews: some View {
        HomeEpisodes(episodesArray: [HomeEpisode(id: 1, name: "Piloto", episode: "1", characters: ["1","2"])])
    }
}
