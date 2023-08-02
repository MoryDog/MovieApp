//
//  MovieRow.swift
//  MovieApp
//
//  Created by Huy Hua Nam on 31/07/2023.
//

import SwiftUI

struct MovieRow: View {
    let movie: Movie
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        
        HStack() {
            ZStack {
//                Rectangle()
//                    .fill(Color.gray.opacity(0.3))
                
                if self.imageLoader.image != nil {
                    Image(uiImage: self.imageLoader.image!)
                        .resizable()
                        
                        .clipped()
                        .frame(width: 70, height: 100)
                        .aspectRatio(contentMode: .fit)

                }
            }
            .frame(width: 70, height: 100)
         

                HStack() {
        
                    VStack(alignment: .leading, spacing: 4.0) {
                        Text("DUNE: Part 2").font(.headline)
                        Text("Denis Villeneuve")
                                            .font(.subheadline)
                                        Group {
                                            Text("Action, Adventure, Sci-Fi, Drama")
                                            Text("195 min")
                                        }
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                    }
                    Spacer()
                }
                


             
            
        }
        .lineLimit(1)
        .onAppear {
            self.imageLoader.loadImage(with: self.movie.posterURL!)
        }
        
   
    }
}

struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieRow(movie: Movie.sampleMovie)
    }
}
