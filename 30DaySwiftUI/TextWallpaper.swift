//
//  GuessFlag.swift
//  30DaySwiftUI
//
//  Created by Jenny Li on 2/2/20.
//  Copyright © 2020 Jenny Li. All rights reserved.
//

import SwiftUI

struct TextWallpaper: View {
    @State private var quote = "Get Shit Done"
    @State private var fontSize = 80
    var body: some View {
        
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            Color.black
                .edgesIgnoringSafeArea(.all)
           
            VStack {
                Color(red:0.98, green:0.93, blue:0.82)
                    .edgesIgnoringSafeArea(.all)
                HStack {
                    Text("Enter Text:")
                    
                    TextField("Enter Quote", text: $quote)
                }.padding()
                
                Stepper(value: $fontSize, in: 0...90, step: 4, label: {
                    Text("Font size: \(fontSize)")
                    
                })
                    .padding()
                
            }.background(Color(red:0.73, green:0.78, blue:0.77))
            VStack {
                Text("\(quote.uppercased())")
                    .font(.system(size: CGFloat(fontSize)))
                    .fontWeight(.black)
                    .lineLimit(10)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color(red:0.82, green:0.13, blue:0.25))
                    .padding()
                Spacer()
                    .frame(height: 100)
            }
            
        }
    }
}



struct GuessFlag_Previews: PreviewProvider {
    static var previews: some View {
        TextWallpaper()
    }
}

