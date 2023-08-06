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

struct MovieBackdropCard: View {
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
            .cornerRadius(10)
            .shadow(radius: 5)

            HStack (){
                Text(movie.title).font(.headline).padding(5)
                Spacer()
                if let date = movie.releaseDate {
                    Text(date.prefix(4)).font(.subheadline)
                }
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
        MovieBackdropCard(movie: Movie.sampleMovie)
    }
}
