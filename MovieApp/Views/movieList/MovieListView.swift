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
