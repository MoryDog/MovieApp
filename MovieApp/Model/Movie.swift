//
//  Movie.swift
//  MovieApp
//
//  Created by Huy Hua Nam on 31/07/2023.
//

import Foundation
import SwiftUI

struct MovieResponse: Decodable {
    let results: [Movie]
}

struct Movie: Identifiable, Decodable {
    let id: Int
    let title: String
    let backdropPath: String?
    let posterPath: String?
    let overview: String
    let voteAverage: Double
    let voteCount: Int
    let runtime: Int?
    let releaseDate: String?
    
    let genres: [MovieGenre]?
    let credits: MovieCredit?
    let videos: MovieVideoResponse?
    
    var backdropURL: URL? {
            guard let backdropPath = backdropPath else { return nil }
            return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath)")
        }
        
        var posterURL: URL? {
            guard let posterPath = posterPath else { return nil }
            return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
        }
        
        var genreText: String {
            return genres?.first?.name ?? "n/a"
        }
        
        var ratingText: String {
            let rating = Int(voteAverage)
            return (0..<rating).reduce("") { (acc, _) -> String in
                return acc + "★"
            }
        }
        
        var scoreText: String {
            return ratingText.isEmpty ? "n/a" : "\(ratingText.count)/10"
        }
        
        var yearText: String {
            guard let releaseDate = releaseDate, let date = Utils.dateFormatter.date(from: releaseDate) else {
                return "n/a"
            }
            return Movie.yearFormatter.string(from: date)
        }
        
        var durationText: String {
            guard let runtime = runtime, runtime > 0 else {
                return "n/a"
            }
            return Movie.durationFormatter.string(from: TimeInterval(runtime) * 60) ?? "n/a"
        }
        
        var cast: [MovieCast]? {
            return credits?.cast
        }
        
        var crew: [MovieCrew]? {
            return credits?.crew
        }
        
        var directors: [MovieCrew]? {
            return crew?.filter { $0.job.lowercased() == "director" }
        }
        
        var producers: [MovieCrew]? {
            return crew?.filter { $0.job.lowercased() == "producer" }
        }
        
        var screenWriters: [MovieCrew]? {
            return crew?.filter { $0.job.lowercased() == "story" }
        }
        
        var youtubeTrailers: [MovieVideo]? {
            return videos?.results.filter { $0.youtubeURL != nil }
        }
    }

    struct MovieGenre: Decodable {
        let name: String
    }

    struct MovieCredit: Decodable {
        let cast: [MovieCast]
        let crew: [MovieCrew]
    }

    struct MovieCast: Decodable, Identifiable {
        let id: Int
        let character: String
        let name: String
    }

    struct MovieCrew: Decodable, Identifiable {
        let id: Int
        let job: String
        let name: String
    }

    struct MovieVideoResponse: Decodable {
        let results: [MovieVideo]
    }

    struct MovieVideo: Decodable, Identifiable {
        let id: String
        let key: String
        let name: String
        let site: String
        
        var youtubeURL: URL? {
            return site == "YouTube" ? URL(string: "https://youtube.com/watch?v=\(key)") : nil
        }
    }

    extension Movie {
        static private let yearFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy"
            return formatter
        }()
        
        static private let durationFormatter: DateComponentsFormatter = {
            let formatter = DateComponentsFormatter()
            formatter.unitsStyle = .full
            formatter.allowedUnits = [.hour, .minute]
            return formatter
        }()
    }

    struct Utils {
        static let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd-MM-yyyy"
            return formatter
        }()
}

