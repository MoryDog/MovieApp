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
                if self.imageLoader.image != nil {
                    Image(uiImage: self.imageLoader.image!)
                        .resizable()
                        .cornerRadius(8)
                        .clipped()
                        .frame(width: 100, height: 170)
                        .aspectRatio(contentMode: .fit)

                }
            }
            .fixedSize()
        
                HStack() {
                    VStack(alignment: .leading, spacing: 4.0) {
                        Text(movie.title).titleStyle().foregroundColor(Color("CinemaGold")).lineLimit(2)
                        if movie.directors != nil && movie.directors!.count > 0 {
                            ForEach(self.movie.directors!.prefix(2)) { crew in
                                Text(crew.name).font(.subheadline)
                            }
                        }
                                        
                        Text(Utils.dateFormatter.string(from: movie.release_Date ?? Date()))
                            .font(.subheadline)
                            .foregroundColor(.primary)
                        Text(movie.overview)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .lineLimit(2)
                            .truncationMode(.tail)
                    }
                    Spacer()
                }
                
        }
        .padding(.top, 8)
        .padding(.bottom, 8)
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
