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

class MovieListState: ObservableObject {
    
    @Published var movies: [Movie]?
    @Published var isLoading: Bool = false
    @Published var error: NSError?

    private let movieService: MovieService
    
    init(movieService: MovieService = TMDBService.shared) {
        self.movieService = movieService
    }
    
    func loadMovies(with endpoint: MovieListEndpoint) {
        self.movies = nil
        self.isLoading = true
        self.movieService.fetchMovies(from: endpoint) { [weak self] (result) in
            guard let self = self else { return }
            self.isLoading = false
            switch result {
            case .success(let response):
                self.movies = response.results
                
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
    
}
