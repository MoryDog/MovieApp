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

struct MoviePosterCarousel: View {
    let title: String
    let movies: [Movie]
    
    var body: some View {
        VStack(alignment: .leading,spacing: 0) {
            //Oswald
            Text(title)
                .font(.custom("Oswald", size: 28))
                .foregroundColor(Color("CinemaGold"))
                .padding(.horizontal)
                .padding(.bottom)
                
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(self.movies) { movie in
                        NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                            MoviePosterCard(movie: movie)
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

struct MoviePosterCarousel_Previews: PreviewProvider {
    static var previews: some View {
        MoviePosterCarousel(title: "Now Playing", movies: Movie.sampleMovies)
    }
}
