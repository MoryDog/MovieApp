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
                        .frame(width: 110, height: 170)
                        .aspectRatio(contentMode: .fit)

                }
            }
            .fixedSize()
                HStack() {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(movie.title).titleStyle().foregroundColor(Color("CinemaGold")).lineLimit(2).padding(.bottom,10)
                    
                        Text(Utils.dateFormatter.string(from: movie.release_Date ?? Date()))
                            .font(.subheadline)
                            .foregroundColor(.primary).padding(.bottom, 10)
                        Text(movie.overview)
                            .foregroundColor(.secondary)
                            .lineLimit(3)
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
