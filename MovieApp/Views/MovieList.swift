//
//  MovieList.swift
//  MovieApp
//
//  Created by Huy Hua Nam on 02/08/2023.
//

import SwiftUI

struct MovieList: View {
    let movies: [Movie]
    
    var body: some View {
       
            List(self.movies){
                movie in
                NavigationLink{
                    MovieDetailView(movieId: movie.id)
                }
                label: {
                    MovieRow(movie: movie)
                }
            }
            .frame(height: 600)
    

    }
    
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList(movies: Movie.sampleMovies)
    }
}
