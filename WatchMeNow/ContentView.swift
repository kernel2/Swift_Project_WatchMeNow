//
//  ContentView.swift
//  WatchMeNow
//
//  Created by Fahraoui Zakaria on 29/06/2020.
//  Copyright © 2020 Fahraoui Zakaria. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    init() {
//        UITableView.appearance().backgroundColor = UIColor.red
//        UITabBar.appearance().backgroundColor = UIColor.red
    }
    
    var body: some View {
        TabView {
            MovieListView()
                .tabItem {
                    VStack {
                        Image(systemName: "tv")
                        Text("Movies")
                    }
            }
            .tag(0)
            
            MovieSearchView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
            }
            .tag(1)
        }.environment(\.colorScheme, .dark)
            .edgesIgnoringSafeArea([.top])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
