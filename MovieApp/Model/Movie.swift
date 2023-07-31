//
//  Movie.swift
//  MovieApp
//
//  Created by Huy Hua Nam on 31/07/2023.
//

import Foundation
import SwiftUI

struct Movie: Decodable {
    let title: String
    let year: String
    let runtime: String
    let genre: String
    let director: String
    let actors: String
    let plot: String
    let country: String
    let awards: String
    let poster: String
}
