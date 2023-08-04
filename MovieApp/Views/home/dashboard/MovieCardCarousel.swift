//
//  MovieCardCarousel.swift
//  MovieApp
//
//  Created by Huy Hua Nam on 01/08/2023.
//

import SwiftUI

struct MovieCardCarousel: View {
    let title: String
    let movies: [Movie]
    
    var body: some View {
        VStack(alignment: .leading,spacing: 0) {
            HStack {
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .padding(.bottom)
                Spacer()
        
                }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(self.movies) { movie in
                        NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                            MovieCard(movie: movie).frame(width: 250, height: 180)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.leading, movie.id == self.movies.first!.id ? 16 : 0)
                        .padding(.trailing, movie.id == self.movies.last!.id ? 16 : 0)
                    }
                }
                
            }
        }
    }
}

struct MovieCardCarousel_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardCarousel(title: "Latest", movies: Movie.sampleMovies)
    }
}
