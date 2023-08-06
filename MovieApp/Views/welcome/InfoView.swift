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
