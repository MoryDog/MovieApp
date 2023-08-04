//
//  GreetingView.swift
//  ContactList
//
//  Created by Tom Huynh on 7/26/22.
//

import SwiftUI

struct GreetingView: View {
    @Binding var active: Bool
    var body: some View {
        ZStack{
            Color("LightPink").ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20){
                Spacer()
                HStack(spacing: 0) {
                    Image("MovieAppIcon").aspectRatio(contentMode: .fit).frame(width: 210)
                    VStack{
                        Text("MovieDB")
                            .font(.system(size: 30))
                            .fontWeight(.heavy)
                            .foregroundColor(.white).padding(.bottom, 2)
                        Text("Cinema is a world of imagination")
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)

                        
                    }.padding(.trailing, 10)
                }
                Spacer()
            

                Button(action: {
                    active = false
                }, label: {
                    Capsule()
                      .fill(Color.white.opacity(0.2))
                      .padding(8)
                      .frame(height:80)
                      .overlay(Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white))
                })
            }
        }
    }
}

struct GreetingView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingView(active: .constant(true))
    }
}
