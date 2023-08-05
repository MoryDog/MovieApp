//
//  MovieList.swift
//  MovieApp
//
//  Created by Huy Hua Nam on 02/08/2023.
//

import SwiftUI

struct MovieListView: View {
    let movies: [Movie]
    @State private var isDarkMode = false
    
    var body: some View {
        NavigationView() {
            List(self.movies){
                movie in
                NavigationLink{
                    MovieDetailView(movieId: movie.id)
                }
            label: {
                MovieRow(movie: movie)
                }
            }.navigationBarItems(leading: Text("Most Recent").font(.custom("FjallaOne-Regular", size: 30))
                .foregroundColor(Color("CinemaGold"))
            ).padding(.top, -20)
                
        }
    }
    
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(movies: Movie.sampleMovies)
    }
}
