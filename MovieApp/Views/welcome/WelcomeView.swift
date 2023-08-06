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
