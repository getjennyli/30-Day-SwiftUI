//
//  GuessFlag.swift
//  30DaySwiftUI
//
//  Created by Jenny Li on 2/4/20.
//  Copyright © 2020 Jenny Li. All rights reserved.
//

import SwiftUI

struct GuessFlag: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var resultMessage = ""
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("Your score is: \(score)")

                    
                }
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    }
                }
                Spacer()
                
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text(resultMessage), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
                })
        }
        
    }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            resultMessage = "Your score is \(score)"
        } else {
            scoreTitle = "Wrong!"
            resultMessage = "That's the flag of \(countries[number])"

            
        }
        showingScore = true
    }
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct GuessFlag_Previews: PreviewProvider {
    static var previews: some View {
        GuessFlag()
    }
}
