//
//  WelcomeView.swift
//  MovieApp
//
//  Created by Huy Hua Nam on 04/08/2023.
//

import SwiftUI

struct WelcomeView: View {
    @State var isWelcomeActive: Bool = true
    
    var body: some View {
        if isWelcomeActive {
            GreetingView(active: $isWelcomeActive)
        } else {
            TabView {
                MovieDashboardView(movies: Movie.sampleMovies)
                    .tabItem {
                        VStack {
                            Image(systemName: "play.tv")
                            Text("Movies")
                        }
                }
                .tag(0)
                MovieListView(movies: Movie.sampleMovies)
                    .tabItem {
                        VStack {
                            Image(systemName: "list.dash")
                            Text("Browse")
                        }
                }
                .tag(1)
                
                MovieSearchView()
                    .tabItem {
                        VStack {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }
                }
                .tag(2)
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
