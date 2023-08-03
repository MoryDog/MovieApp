//
//  ContentView.swift
//  MovieApp
//
//  Created by Huy Hua Nam on 31/07/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MovieDashboardView(movies: Movie.sampleMovies)
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
            .tag(0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
