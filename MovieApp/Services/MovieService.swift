//
//  MovieService.swift
//  MovieApp
//
//  Created by Huy Hua Nam on 01/08/2023.
//

import Foundation

protocol MovieService {
    func fetchMovies(with parameters: MovieParameters, completion: @escaping (Result<MovieResponse, MovieError>) -> ())
    func fetchMovieDetails(for id: Int, completion: @escaping (Result<Movie, MovieError>) -> ())
}

struct MovieParameters {
    var endpoint: MovieListEndpoint
    var query: String?
    var page: Int?
}

enum MovieListEndpoint: String, CaseIterable, Identifiable {
    var id: String { rawValue }
    
    case nowPlaying = "now_playing"
    case upcoming
    case topRated = "top_rated"
    case popular
    
    var description: String {
        switch self {
        case .nowPlaying: return "Now Playing"
        case .upcoming: return "Upcoming"
        case .topRated: return "Top Rated"
        case .popular: return "Popular"
        }
    }
}

enum MovieError: Error, CustomNSError {
    case apiError(Error)
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    
    var localizedDescription: String {
        switch self {
        case .apiError(let error): return "Failed to fetch data: \(error.localizedDescription)"
        case .invalidEndpoint: return "Invalid endpoint"
        case .invalidResponse: return "Invalid response"
        case .noData: return "No data"
        case .serializationError: return "Failed to decode data"
        }
    }
    
    var errorUserInfo: [String: Any] {
        [NSLocalizedDescriptionKey: localizedDescription]
    }
}
