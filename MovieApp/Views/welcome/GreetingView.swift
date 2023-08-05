//
//  GreetingView.swift
//  ContactList
//
//  Created by Tom Huynh on 7/26/22.
//

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
                }.padding(.top, -30).padding(.trailing, 25)
           
               Spacer()
                
                Image("Clapper").resizable().frame(width: 200, height: 200)
                VStack{
                    Text("MovieDB")
                        .font(.custom("FjallaOne-Regular", size: 45)).foregroundColor(Color("CinemaGold"))
                        .fontWeight(.heavy)
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
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                        .frame(width: 360, height:80)
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
