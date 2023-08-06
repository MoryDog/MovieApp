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

struct MoviePosterCard: View {
    let movie: Movie
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        ZStack {
            if self.imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(8)
                    .shadow(radius: 4)
                
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .cornerRadius(8)
                    .shadow(radius: 4)
                
                Text(movie.title)
                    .multilineTextAlignment(.center)
            }
        }
        .frame(width: 204, height: 306)
        .onAppear {
            self.imageLoader.loadImage(with: self.movie.posterURL!)
        }
    }
}

struct MoviePosterCard_Previews: PreviewProvider {
    static var previews: some View {
        MoviePosterCard(movie: Movie.sampleMovie)
    }
}
