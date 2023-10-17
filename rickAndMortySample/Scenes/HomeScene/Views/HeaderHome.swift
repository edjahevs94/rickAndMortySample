//
//  HeaderHome.swift
//  rickAndMortySample
//
//  Created by EdgardVS on 17/10/23.
//

import SwiftUI

struct HeaderHome: View {
    var body: some View {
        HStack() {
            Image("logo")
                .resizable()
                .frame(width: 50, height: 50)
            Text("Home").font(.caption)
            Spacer()
            HStack(spacing: 20.0) {
                Image(systemName: "plus.app").resizable().frame(width: 20, height: 20)
                Image(systemName: "magnifyingglass").resizable().frame(width: 20, height: 20)
            
            }
        }.padding(.horizontal, 15)
            .padding(.vertical, 3)
    }
}

struct HeaderHome_Previews: PreviewProvider {
    static var previews: some View {
        HeaderHome()
    }
}
