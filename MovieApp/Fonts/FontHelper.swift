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
        return Font.custom("Proxima Nova Medium", size: size)
    }
    
    public static func FjallaOne(size: CGFloat) -> Font {
        return Font.custom("FjallaOne-Regular", size: size)
    }
    
    public static func ProximaNovaItalic(size: CGFloat) -> Font {
        return Font.custom("ProximaNovaRegularItalic", size: size)
    }
}

struct TitleFont: ViewModifier {
    let size: CGFloat
    
    func body(content: Content) -> some View {
        return content.font(.FjallaOne(size: size))
    }
}

extension View {
    func titleFont(size: CGFloat) -> some View {
        return ModifiedContent(content: self, modifier: TitleFont(size: size))
    }
    
    func titleStyle() -> some View {
        return ModifiedContent(content: self, modifier: TitleFont(size: 18))
    }
}
