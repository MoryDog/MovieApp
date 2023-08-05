//
//  InfoView.swift
//  MovieApp
//
//  Created by Huy Hua Nam on 05/08/2023.
//

import SwiftUI

struct InfoView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack (spacing: 10){
            Text("Hua Nam Huy - s3881103").bold()
            Text("COSC2659 - IOS Development")
            Text("BH120 - Bachelor of Software Engineering")
            
        }  .frame(maxWidth: .infinity, maxHeight: .infinity)
            .multilineTextAlignment(.center)
        
        
        .cornerRadius(10)
        .padding()
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
