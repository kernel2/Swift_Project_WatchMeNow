//
//  ContentView.swift
//  WatchMeNow
//
//  Created by Fahraoui Zakaria on 29/06/2020.
//  Copyright © 2020 Fahraoui Zakaria. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MovieListView()
                .tabItem {
                    VStack{
                        Image(systemName: "tv")
                        Text("Movies")
                    }
            }
            .tag(0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
