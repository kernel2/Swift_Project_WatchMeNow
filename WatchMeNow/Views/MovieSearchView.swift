//
//  MovieSearchView.swift
//  WatchMeNow
//
//  Created by Fahraoui Zakaria on 12/07/2020.
//  Copyright © 2020 Fahraoui Zakaria. All rights reserved.
//

import SwiftUI

struct MovieSearchView: View {
    
    @ObservedObject var movieSearchState = MovieSearchState()
    
    var body: some View {
        NavigationView {
            List {
                
                SearchBarView(placeholder: "Search movies", text: self.$movieSearchState.query)
                    .listRowInsets(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)).foregroundColor(.white)
                
                LoadingView(isLoading: self.movieSearchState.isLoading, error: self.movieSearchState.error) {
                    self.movieSearchState.search(query: self.movieSearchState.query)
                }.foregroundColor(.white)
                
                if self.movieSearchState.movies != nil {
                    ForEach(self.movieSearchState.movies!) { movie in
                        NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                            VStack(alignment: .leading) {
                                Text(movie.title)
                                Text(movie.yearText)
                            }.foregroundColor(.white)
                        }
                    }
                }
            }
            .onAppear {
                self.movieSearchState.startObserve()
            }
            .navigationBarTitle("Search you movie")
        }.environment(\.colorScheme, .dark)
            .edgesIgnoringSafeArea(.all)
    }
}

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        let appearance =
            UINavigationBarAppearance()
        appearance.backgroundColor = .darkGray
        navigationBar.standardAppearance = appearance
    }
}

struct MovieSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchView()
    }
}
