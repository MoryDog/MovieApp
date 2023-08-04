//
//  FontHelper.swift
//  MovieApp
//
//  Created by Huy Hua Nam on 04/08/2023.
//

import Foundation
import SwiftUI

extension Font {
    public static func ProximaNova(size: CGFloat) -> Font {
        return Font.custom("Proxima Nova", size: size)
    }
}

struct MovieTitleFont: ViewModifier {
    let size: CGFloat
    
    func body(content: Content) -> some View {
        return content.font(.ProximaNova(size: size))
    }
}

extension View {
    func titleFont(size: CGFloat) -> some View {
        return ModifiedContent(content: self, modifier: MovieTitleFont(size: size))
    }
    
    func titleStyle() -> some View {
        return ModifiedContent(content: self, modifier: MovieTitleFont(size: 16))
    }
}
