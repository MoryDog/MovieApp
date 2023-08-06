/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Hua Nam Huy
  ID: s3881103
  Created  date: 31/7/2023
  Last modified: 6/8/2023
  Acknowledgement: Acknowledge the resources that you use here.
*/


import SwiftUI

struct MovieDashboardView: View {
    @State private var isDarkMode = false
    let movies: [Movie]
    @ObservedObject private var nowPlayingState = MovieListState()
    @ObservedObject private var upcomingState = MovieListState()
    @ObservedObject private var topRatedState = MovieListState()
    @ObservedObject private var popularState = MovieListState()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Group {
                        if nowPlayingState.movies != nil {
                            MoviePosterCarousel(title: "Now Playing", movies: nowPlayingState.movies!)
                            
                        } else {
                            LoadingView(isLoading: self.nowPlayingState.isLoading, error: self.nowPlayingState.error) {
                                self.nowPlayingState.loadMovies(with: .nowPlaying)
                            }
                        }
                        
                    }
                    .listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                    
                    Group {
                        if popularState.movies != nil {
                            MovieBackdropCarousel(title: "Popular", movies: popularState.movies!)
    
                        } else {
                            LoadingView(isLoading: self.popularState.isLoading, error: self.popularState.error) {
                                self.popularState.loadMovies(with: .popular)
                            }
                        }
                    }
                    .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 16, trailing: 0))
                    Group {
                        if upcomingState.movies != nil {
                            MovieBackdropCarousel(title: "Upcoming", movies: upcomingState.movies!)
                        } else {
                            LoadingView(isLoading: self.upcomingState.isLoading, error: self.upcomingState.error) {
                                self.upcomingState.loadMovies(with: .upcoming)
                            }
                        }
                    }
                    .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                    
                    Group {
                        if topRatedState.movies != nil {
                            MovieBackdropCarousel(title: "Top Rated", movies: topRatedState.movies!)
                            
                        } else {
                            LoadingView(isLoading: self.topRatedState.isLoading, error: self.topRatedState.error) {
                                self.topRatedState.loadMovies(with: .topRated)
                            }
                        }
                        
                    }
                    .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                    
                    
                }
                .navigationBarItems(leading: Text("Home").font(.custom("FjallaOne-ReGULAR", size: 30))
                    .foregroundColor(Color("CinemaGold"))
                ).padding(.top, -20)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Toggle(isOn: $isDarkMode) {
                                Image(systemName: isDarkMode ? "moon.circle.fill" : "moon.circle").foregroundColor(isDarkMode ? .white : .black)
                            }.accentColor(Color.clear)
                        }
                    }.preferredColorScheme(isDarkMode ? .dark : .light)
            }
            
        }.accentColor(Color("CinemaGold"))
        .onAppear {
            self.nowPlayingState.loadMovies(with: .nowPlaying)
            self.popularState.loadMovies(with: .popular)
            self.upcomingState.loadMovies(with: .upcoming)
            self.topRatedState.loadMovies(with: .topRated)
        
        }
        
        
    }
}

struct MovieDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDashboardView(movies: Movie.sampleMovies)
    }
}
