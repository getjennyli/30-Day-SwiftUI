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
    @State private var count = 0
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 32) {
                
                Text("Do the")
                    .bold()
                    .font(.system(size: 70))
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .foregroundColor(.white)
                    .frame(height: 56)
                Text("Push Ups")
                    .bold()
                    .font(.system(size: 70))
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .foregroundColor(.white)
                    .frame(height: 32)
                
                Text("Current: \(count)")
                    .bold()
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                Spacer()
                    .frame(height: 24)
                Button(action: {self.count += 1}){
                                  Text("+ Add")
                                      .font(.system(size: 24))
                                      .bold()
                                      .foregroundColor(.orange)
                              }
                Button(action: {self.count -= 1}){
                    Text("- Minus")
                        .font(.system(size: 24))
                        .bold()
                        .foregroundColor(.red)
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width-80)
            }
            .background(Color.black)
        }
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView()
    }
}
