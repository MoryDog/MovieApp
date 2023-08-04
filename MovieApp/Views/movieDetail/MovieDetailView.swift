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
                MovieDetailListView(movie: self.movieDetailState.movie!)
            }
        }
        .navigationBarTitle(movieDetailState.movie?.title ?? "")
        .onAppear {
            self.movieDetailState.loadMovie(id: self.movieId)
            
        }
    }
}


struct MovieDetailListView: View {
    let movie: Movie
    private let availableColors: [Color] = [.red, .blue, .green, .orange, .purple, .pink]
    
    
   // @State private var selectedTrailer: MovieVideo?
    let imageLoader = ImageLoader()
    @State var isOverviewExpanded: Bool = false
    
    var body: some View {
        List {
            MovieDetailImage(imageLoader: imageLoader, imageURL: self.movie.backdropURL!, overlayText: movie.title)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            HStack {
                if let date = movie.releaseDate {
                    Text(date.prefix(4)).font(.subheadline).bold()
                }
                Spacer()
                Text("•")
                Spacer()
                if let runtime = movie.runtime {
                    Text("\(runtime) minutes")
                        .font(.subheadline).bold()
                }
                Spacer()
                Text("•")
                Spacer()
                if let status = movie.status {
                    Text("\(status)")
                        .font(.subheadline).bold()
                }

            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Overview").bold()
                Text(movie.overview)
                    .font(.subheadline)
                    .lineLimit(self.isOverviewExpanded ? nil : 4)
                    .onTapGesture {
                        withAnimation {
                            self.isOverviewExpanded.toggle()
                        }
                    }
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation(Animation.easeInOut(duration: 0.4)) {
                            self.isOverviewExpanded.toggle()
                        }
                    }, label: {
                        Text(self.isOverviewExpanded ? "Less" : "Read more")
                            .font(.subheadline)
                            .foregroundColor(.cyan)
                    }).padding(.trailing, 5)
                }
            }
            HStack {
                ScrollView(.horizontal, showsIndicators: false){
                    if let genres = movie.genres {
                        HStack {
                            ForEach(genres.indices, id: \.self) { index in
                                RoundedBadge(text: genres[index].name, color: availableColors[index])
                                    .padding(.top, 2)
                            }
                        }
                    }
                }
            }
            
            HStack {
                Text("Ratings: ").bold()
                if !movie.ratingText.isEmpty {
                    Text(movie.ratingText).foregroundColor(.yellow)
                }
                Text(movie.scoreText)
            }
            
            
            HStack(alignment: .top, spacing: 4) {
                if movie.cast != nil && movie.cast!.count > 0 {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Starring").font(.headline)
                        ForEach(self.movie.cast!.prefix(9)) { cast in
                            Text(cast.name)
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    
                }
                
                if movie.crew != nil && movie.crew!.count > 0 {
                    VStack(alignment: .leading, spacing: 4) {
                        if movie.directors != nil && movie.directors!.count > 0 {
                            Text("Director(s)").font(.headline)
                            ForEach(self.movie.directors!.prefix(2)) { crew in
                                Text(crew.name)
                            }
                        }
                        
                        if movie.producers != nil && movie.producers!.count > 0 {
                            Text("Producer(s)").font(.headline)
                                .padding(.top)
                            ForEach(self.movie.producers!.prefix(2)) { crew in
                                Text(crew.name)
                            }
                        }
                        
                        if movie.screenWriters != nil && movie.screenWriters!.count > 0 {
                            Text("Screenwriter(s)").font(.headline)
                                .padding(.top)
                            ForEach(self.movie.screenWriters!.prefix(2)) { crew in
                                Text(crew.name)
                            }
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
            }
            
        }
        
    }
}

struct MovieDetailImage: View {
    @ObservedObject var imageLoader: ImageLoader
    let imageURL: URL
    let overlayText: String
    
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
