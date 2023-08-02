//
//  MovieDetail.swift
//  MovieApp
//
//  Created by Huy Hua Nam on 01/08/2023.
//

import SwiftUI

struct MovieDetailView: View {
    let movieId: Int
    @ObservedObject private var movieDetailState = MovieDetailState()
    
    var body: some View {
        ZStack {
            LoadingView(isLoading: self.movieDetailState.isLoading, error: self.movieDetailState.error) {
                self.movieDetailState.loadMovie(id: self.movieId)
            }
            
            if movieDetailState.movie != nil {
                // ...
            }
        }
    }
}

struct MovieDetailImage: View {
    @ObservedObject var imageLoader: ImageLoader
    let imageURL: URL
    
    var body: some View {
        ZStack{
            Rectangle().fill(Color.gray.opacity(0.3))
            if self.imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!).resizable()
            }
        }
        .aspectRatio(16/9, contentMode: .fit)
        .onAppear {
            self.imageLoader.loadImage(with: self.imageURL)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movieId: Movie.sampleMovie.id)
    }
}
