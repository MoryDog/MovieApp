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

struct MovieSearchView: View {
    @ObservedObject var movieSearchState = SearchMovieState()
    @State private var isDarkMode = false
    
    var body: some View {
        NavigationView {
            List {
                SearchBarView(placeholder: "Enter movie name", text: self.$movieSearchState.query)
                    .listRowInsets(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                
                LoadingView(isLoading: self.movieSearchState.isLoading, error: self.movieSearchState.error) {
                    self.movieSearchState.search(query: self.movieSearchState.query)
                }
                
                if self.movieSearchState.movies != nil {
                    ForEach(self.movieSearchState.movies!) { movie in
                        NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                            VStack(alignment: .leading) {
                                Text(movie.title)
                                if let date = movie.releaseDate {
                                    Text(date.prefix(4)).font(.subheadline)
                                }
                            }
                        }
                    }
                }
                
            }
            .onAppear {
                self.movieSearchState.startObserve()
            }
            .navigationBarItems(leading: Text("Search").font(.custom("FjallaOne-ReGULAR", size: 30))
                .foregroundColor(Color("CinemaGold"))
            ).padding(.top, -20)
        }
    }
}

struct MovieSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchView()
    }
}
