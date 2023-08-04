//
//  MovieList.swift
//  MovieApp
//
//  Created by Huy Hua Nam on 02/08/2023.
//

import SwiftUI

struct MovieListView: View {
    let movies: [Movie]
    
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
            }
        }.navigationBarTitle(Text("All movies"))
    }
    
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(movies: Movie.sampleMovies)
    }
}
