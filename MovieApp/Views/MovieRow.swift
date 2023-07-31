//
//  MovieRow.swift
//  MovieApp
//
//  Created by Huy Hua Nam on 31/07/2023.
//

import SwiftUI

struct MovieRow: View {
    var body: some View {
        HStack() {
            Image("dune_poster").resizable().frame(width: 70.0, height: 110.0).shadow( color: .gray, radius: 10.0, x: 4.0, y: 4.0)
            VStack(alignment: .leading, spacing: 4.0) {
                Text("DUNE: Part 2").font(.headline)
                Text("Denis Villeneuve")
                                    .font(.subheadline)
                                Group {
                                    Text("Action, Adventure, Sci-Fi, Drama")
                                    Text("195 min")
                                }
                                .font(.caption)
                                .foregroundColor(.secondary)
            }
            Spacer()
        }
    }
}

struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieRow().padding().previewLayout(.sizeThatFits)
    }
}
