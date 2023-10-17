//
//  CharacterCell.swift
//  rickAndMortySample
//
//  Created by EdgardVS on 17/10/23.
//

import SwiftUI

struct CharacterCell: View {
    
    var urlString: String
    var name: String
    
    var body: some View {
        VStack(alignment: .center) {
            VStack {
                AsyncImage(url: URL(string: urlString)) { image in
                    image.resizable()
                        .frame(width: 60, height: 60)
                        .cornerRadius(50)
                } placeholder: {
                    ProgressView()
                }
                
            }.overlay (
                Circle()
                    .stroke(LinearGradient(colors: [.red, .purple, .red, .orange, .yellow, .orange]
                                           , startPoint: .topLeading
                                           ,endPoint: .bottomTrailing)
                            ,lineWidth: 2.3)
                    .frame(width: 68, height: 68)
            ).frame(width: 70, height: 70)
            
            Text(name).font(.caption)
                .frame(width: 95, height: 45, alignment: .top)
                .lineLimit(3)
               
                
        }.multilineTextAlignment(.center)
        
       
    }
}

struct CharacterCell_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCell(urlString: "https://rickandmortyapi.com/api/character/avatar/2.jpeg", name: "Morty Smith")
    }
}
