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
    
    var body: some View {
        ZStack{
            Color("LightPink").ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20){
                Spacer()
                
                Image("MovieAppIcon").aspectRatio(contentMode: .fit).frame(width: 120)
                VStack{
                    Text("MovieDB")
                        .font(.custom("FjallaOne-Regular", size: 45))
                        .fontWeight(.heavy)
                        .foregroundColor(.white).padding(.bottom, 2)
                    //                        Text("Cinema is a world of imagination")
                    //                            .font(.custom("Proxima Nova Medium", size: 20))
                    //                        .fontWeight(.light)
                    //                        .foregroundColor(.white)
                    //                        .multilineTextAlignment(.center)
                    
                }.padding(.trailing, 10).padding(.leading, 20)
                Spacer()
                
                Button(action: {
                    showMainContent = true
                }, label: {
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                        .frame(height:80)
                        .overlay(Text("Get Started")
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.white))
                }).fullScreenCover(isPresented: $showMainContent) {
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
    }
}

struct GreetingView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingView(active: .constant(true))
    }
}
