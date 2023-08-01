//
//  MovieCard.swift
//  MovieApp
//
//  Created by Huy Hua Nam on 01/08/2023.
//

import SwiftUI

struct MovieCard: View {
    let movie: Movie
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                
                if self.imageLoader.image != nil {
                    Image(uiImage: self.imageLoader.image!)
                        .resizable()
                }
            }
            .aspectRatio(16/9, contentMode: .fit)
            .cornerRadius(8)
            .shadow(radius: 4)
            
            HStack {
                Text(movie.title).font(.headline).padding(5)
                Spacer()
                Text(movie.releaseDate ?? "n/a").padding(5)
            }
            
        }
        .lineLimit(1)
        .onAppear {
            self.imageLoader.loadImage(with: self.movie.backdropURL!)
        }
    }
}

struct MovieCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieCard(movie: Movie.sampleMovie)
    }
}
