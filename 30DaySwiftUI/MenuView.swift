//
//  MenuView.swift
//  30DaySwiftUI
//
//  Created by Jenny Li on 2/4/20.
//  Copyright © 2020 Jenny Li. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    @State private var days = 4
    @State private var views = ["CounterView", "TextWallpaper", "RandomGradient", "GuessNumber", "GuessFlag"]
    @State private var nextView = ""
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 30) {
                NavigationLink(destination: CounterView()) {
                                   Text("Day One")
                               }
                NavigationLink(destination: TextWallpaper()) {
                                   Text("Text Wallpaper")
                               }
                NavigationLink(destination: RandomGradient()) {
                                   Text("Random Gradient")
                               }
                NavigationLink(destination: GuessFlag()) {
                                   Text("Guess Flag")
                               }
                NavigationLink(destination: GuessNumber()) {
                                   Text("Guess Number")
                               }

            }.navigationBarTitle("30 Day SwiftUI")
                .foregroundColor(.black)
                .font(.headline)
            }
    }
    func viewDetail () {
        
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
