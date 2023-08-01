//
//  ModelData.swift
//  MovieApp
//
//  Created by Huy Hua Nam on 31/07/2023.
//

import Foundation

extension Movie {
    static var sampleMovies: [Movie] {
        guard let response: MovieResponse = try? Bundle.main.decodeJSON(filename: "movie_list")
        else {
            return []
        }
        return response.results
    }
    static var sampleMovie: Movie {
        sampleMovies[0]
    }
}
extension Bundle {
    func decodeJSON<D: Decodable>(filename: String) throws -> D {
        guard let url = self.url(forResource: filename, withExtension: "json") else {
                    throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "Invalid JSON file"))
                }
                let data = try Data(contentsOf: url)
                let jsonDecoder = Utilities.jsonDecoder
                do {
                    let decodedModel = try jsonDecoder.decode(D.self, from: data)
                    return decodedModel
                } catch {
                    throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "Failed to decode JSON: \(error)"))
                }
            }}
