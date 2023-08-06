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

struct MovieBackdropCarousel: View {
    let title: String
    let movies: [Movie]
    
    var body: some View {
        VStack(alignment: .leading,spacing: 0) {
            HStack {
                Text(title)
                    .font(.custom("Oswald", size: 28)).foregroundColor(Color("CinemaGold"))
                  
                    .padding(.horizontal)
                    .padding(.bottom)
                Spacer()
        
                }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(self.movies) { movie in
                        NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                            MovieBackdropCard(movie: movie).frame(width: 250, height: 180)
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
        MovieBackdropCarousel(title: "Latest", movies: Movie.sampleMovies)
    }
}
