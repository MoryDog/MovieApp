//
//  TMDBService.swift
//  MovieApp
//
//  Created by Huy Hua Nam on 01/08/2023.
//

import Foundation

class TMDBService: MovieService {
    
    static let shared = TMDBService()
    private init() {}
    
    private let apiKey = "5527b18ae50ad689d0ef20a6cf25619c"
    private let baseAPIURL = "https://api.themoviedb.org/3"
    private let urlSession = URLSession.shared
    private let jsonDecoder = Utils.jsonDecoder
    
    // function to fetch list of movies
    func fetchMovies(from endpoint: MovieListEndpoint, completion: @escaping (Result<MovieResponse, MovieError>) -> ()) {
        guard let url = createURL(for: endpoint.rawValue) else {
                    completion(.failure(.invalidEndpoint))
                    return
                }
                loadURLandDecode(url: url, completion: completion)
    }
        
    // Function to fetch a movie using id
    func fetchMovie(id: Int, completion: @escaping (Result<Movie, MovieError>) -> ()) {
        guard let url = createURL(for: "movie/\(id)", params: ["append_to_response": "videos,credits"]) else {
                    completion(.failure(.invalidEndpoint))
                    return
                }
                loadURLandDecode(url: url, completion: completion)
    }
        
    // Function to search for movie using a query string
    func searchMovie(query: String, completion: @escaping (Result<MovieResponse, MovieError>) -> ()) {
        guard let url = createURL(for: "search/movie", params: [
                    "language": "en-US",
                    "include_adult": "false",
                    "region": "US",
                    "query": query
                ]) else {
                    completion(.failure(.invalidEndpoint))
                    return
                }
                loadURLandDecode(url: url, completion: completion)
    }
        
    // Helper function to load the URL, perform data task, and decode the response
    func loadURLandDecode<D: Decodable>(url: URL, params: [String: String]? = nil, completion: @escaping (Result<D, MovieError>) -> ()) {
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        var queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        if let params = params {
            queryItems.append(contentsOf: params.map { URLQueryItem(name: $0.key, value: $0.value) })
        }
        
        urlComponents.queryItems = queryItems
        
        guard let finalURL = urlComponents.url else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        urlSession.dataTask(with: finalURL) { [weak self] (data, response, error) in
            guard let self = self else { return }
            
            if error != nil {
                self.executeCompletionHandlerInMainThread(with: .failure(.apiError), completion: completion)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                self.executeCompletionHandlerInMainThread(with: .failure(.invalidResponse), completion: completion)
                return
            }
            
            guard let data = data else {
                self.executeCompletionHandlerInMainThread(with: .failure(.noData), completion: completion)
                return
            }
            
            do {
                let decodedResponse = try self.jsonDecoder.decode(D.self, from: data)
                self.executeCompletionHandlerInMainThread(with: .success(decodedResponse), completion: completion)
            } catch {
                self.executeCompletionHandlerInMainThread(with: .failure(.serializationError), completion: completion)
            }
        }.resume()
    }
    
    // Helper function to create the URL with query parameters
    func createURL(for path: String, params: [String: String]? = nil) -> URL? {
        var components = URLComponents(string: baseAPIURL)
        components?.path = "/\(path)"
        
        var queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        if let params = params {
            queryItems += params.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        
        components?.queryItems = queryItems
        
        return components?.url
        }
    
    // Helper function to execute the completion handler on the main thread
    func executeCompletionHandlerInMainThread<D: Decodable>(with result: Result<D, MovieError>, completion: @escaping (Result<D, MovieError>) -> ()) {
            DispatchQueue.main.async {
                completion(result)
            }
    }
}
