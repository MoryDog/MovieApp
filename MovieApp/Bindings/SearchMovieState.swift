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
import Combine
import Foundation

class SearchMovieState: ObservableObject {
    
    @Published var query = ""
    @Published var movies: [Movie]?
    @Published var isLoading = false
    @Published var error: NSError?
    
    private var subscriptionToken: AnyCancellable?
    
    let movieService: MovieService
    
    var isEmptyResults: Bool {
        !self.query.isEmpty && self.movies != nil && self.movies!.isEmpty
    }
    
    init(movieService: MovieService = TMDBService.shared) {
        self.movieService = movieService
    }
    
    func startObserve() {
        guard subscriptionToken == nil else { return }
        
        self.subscriptionToken = self.$query
            .map { [weak self] text in
                self?.movies = nil
                self?.error = nil
                return text
                
        }.throttle(for: 1, scheduler: DispatchQueue.main, latest: true)
            .sink { [weak self] in self?.search(query: $0) }
    }
    
    func search(query: String) {
        self.movies = nil
        self.isLoading = false
        self.error = nil
        
        guard !query.isEmpty else {
            return
        }
        
        self.isLoading = true
        self.movieService.searchMovie(query: query) {[weak self] (result) in
            guard let self = self, self.query == query else { return }
            
            self.isLoading = false
            switch result {
            case .success(let response):
                self.movies = response.results
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
    
    deinit {
        self.subscriptionToken?.cancel()
        self.subscriptionToken = nil
    }
}
