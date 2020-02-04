//
//  CounterView.swift
//  30DaySwiftUI
//
//  Created by Jenny Li on 2/1/20.
//  Copyright © 2020 Jenny Li. All rights reserved.
//
// Day 1

import SwiftUI

struct CounterView: View {
    @State private var color1 = Color.yellow
    @State private var color2 = Color.red
    @State private var colorValue = ""
    @State private var currentType = 0
    @State private var type = ["Red","Green","Blue"]
    @State private var randomColor = Color.red
    
    var random: Color {
        return Color(
            red: 1.0,
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
    
    @State private var count = 0
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 12) {
                Spacer()
                
                Text("Let's Do Push Ups")
                    .fontWeight(.black)
                    .font(.system(size: 60))
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .foregroundColor(.black)
                
                Text("Total: \(count)")
                    .bold()
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                Spacer()
                    .frame(height: 80)
                
                VStack(alignment: .center, spacing: 16) {
                    Button(action: {self.count += 1}){
                        Text("Add")
                            .font(.system(size: 16))
                            .bold()
                            .padding(.horizontal,28)
                            .padding(.vertical, 12)
                            .background(Color.black)
                            .foregroundColor(.white)
                    }.cornerRadius(100)

                    Button(action: {self.count -= 1}){
                        Text("Minus")
                            .font(.system(size: 16))
                            .bold()
                            .foregroundColor(.black)
                    }
                }
                Spacer()
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
                    .padding(.bottom, 16)
                
            }
        }
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView()
    }
}
