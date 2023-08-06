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

struct GreetingView: View {
    @Binding var active: Bool
    @State private var showMainContent = false
    @State private var showInfoPopup = false
    
    var body: some View {
        ZStack{
//            Color("CustomBlue").ignoresSafeArea(.all, edges: .all)
            Image("WelcomeScreenImage").resizable().ignoresSafeArea(.all, edges: .all)
            VStack(spacing: 20){
                HStack {
                    Spacer()
                    Button {
                        showInfoPopup.toggle()
                        } label: {
                            Image(systemName: "info.circle")
                                .font(.title)
                                .foregroundColor(.white)
                        }.sheet(isPresented: $showInfoPopup) {
                            InfoView()
                                .presentationDetents([.height(200)])
                                .presentationDragIndicator(.visible)
                        }
                }.padding(.top, -20).padding(.trailing, 25)
           
               Spacer()
                
                Image("Clapper").resizable().frame(width: 200, height: 200).shadow(color: .orange, radius: 15, x:4 , y:4)
                VStack{
                    Text("MovieHub")
                        .font(.custom("Bodoni-PosterCompressed", size: 45)).foregroundColor(Color("CinemaGold"))
                        .foregroundColor(.white).padding(.bottom, 2)
                    Text("\"Cinema is a world of imagination\"")
                        .font(.custom("ProximaNova-RegularIt", size: 20))
                                            .fontWeight(.light)
                                            .foregroundColor(.white)
                                            .multilineTextAlignment(.center)
                    
                }.padding(.trailing, 10).padding(.leading, 20)
                Spacer()
                
                Button(action: {
                    showMainContent = true
                }, label: {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.white.opacity(0.3))
                        .padding(8)
                        .frame(width: 340, height:75)
                        .overlay(Text("View Movies")
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(Color("CinemaGold")))
                }).fullScreenCover(isPresented: $showMainContent) {
                    TabView {
                        MovieDashboardView(movies: Movie.sampleMovies)
                            .tabItem {
                                VStack {
                                    Image(systemName: "play.tv")
                                    Text("Home")
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
    }
}

struct GreetingView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingView(active: .constant(true))
    }
}
