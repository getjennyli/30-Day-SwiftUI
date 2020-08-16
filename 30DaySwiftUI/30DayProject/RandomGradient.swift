//
//  GuessFlag.swift
//  30DaySwiftUI
//
//  Created by Jenny Li on 2/3/20.
//  Copyright © 2020 Jenny Li. All rights reserved.
//

import SwiftUI

struct RandomGradient: View {
    @State private var showingAlert = false
    
    @State private var color1 = Color.yellow
    @State private var color2 = Color.red
    @State private var colorValue = ""
    @State private var currentType = 0
    @State private var type = ["Red","Green","Blue"]
    @State private var randomColor = Color.red
  
    var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: 1.0
        )
    }
   
    var body: some View {
        
        ZStack(alignment: .bottom) {

            LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                .watermarked(with: "Made with love in NY")

            VStack(spacing: 0) {
                
                Button(action: {
                    //    self.showingAlert = true
                    self.color1 = self.random
                    self.color2 = self.random
                    // Generate random background
                }) {
                    Image("refresh")
                        .renderingMode(.original)
                        .padding(12)
                    
                }.background(Color.black)
                    .cornerRadius(100)
                    .padding(.bottom, 24)
            }
           
        }
        
    }
}


struct RandomGradient_Previews: PreviewProvider {
    static var previews: some View {
        RandomGradient()
    }
}
