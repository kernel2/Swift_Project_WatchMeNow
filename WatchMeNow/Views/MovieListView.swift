//
//  MovieListView.swift
//  WatchMeNow
//
//  Created by Fahraoui Zakaria on 12/07/2020.
//  Copyright © 2020 Fahraoui Zakaria. All rights reserved.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject private var nowPlayingState = MovieListState()
    @ObservedObject private var upcomingState = MovieListState()
    @ObservedObject private var topRatedState = MovieListState()
    @ObservedObject private var popularState = MovieListState()
    
    var body: some View {
        NavigationView {
            List {
                Group {
                    if nowPlayingState.movies != nil {
                        MoviePosterCarouselView(title: "Now Playing", movies: nowPlayingState.movies!)
                        
                    } else {
                        LoadingView(isLoading: self.nowPlayingState.isLoading, error: self.nowPlayingState.error) {
                            self.nowPlayingState.loadMovies(with: .nowPlaying)
                        }
                    }
                    
                }
                .listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                
                Group {
                    if topRatedState.movies != nil {
                        MovieBackdropCarouselView(title: "Top Rated", movies: topRatedState.movies!)
                        
                    } else {
                        LoadingView(isLoading: self.topRatedState.isLoading, error: self.topRatedState.error) {
                            self.topRatedState.loadMovies(with: .topRated)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                
                Group {
                    if popularState.movies != nil {
                        MovieBackdropCarouselView(title: "Popular", movies: popularState.movies!)
                        
                    } else {
                        LoadingView(isLoading: self.popularState.isLoading, error: self.popularState.error) {
                            self.popularState.loadMovies(with: .popular)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 16, trailing: 0))
                
                Group {
                    if upcomingState.movies != nil {
                        MovieBackdropCarouselView(title: "Upcoming", movies: upcomingState.movies!)
                    } else {
                        LoadingView(isLoading: self.upcomingState.isLoading, error: self.upcomingState.error) {
                            self.upcomingState.loadMovies(with: .upcoming)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                
            }
            .navigationBarTitle("The Movies")
        }
        .onAppear {
            self.nowPlayingState.loadMovies(with: .nowPlaying)
            self.upcomingState.loadMovies(with: .upcoming)
            self.topRatedState.loadMovies(with: .topRated)
            self.popularState.loadMovies(with: .popular)
        }.environment(\.colorScheme, .dark)
            .edgesIgnoringSafeArea([.top])
        
    }
}

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        let appearance =
            UINavigationBarAppearance()
        appearance.backgroundColor = .lightGray
        navigationBar.standardAppearance = appearance
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
