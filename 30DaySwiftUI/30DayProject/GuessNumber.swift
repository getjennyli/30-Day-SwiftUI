//
//  GuessNumber.swift
//  30DaySwiftUI
//
//  Created by Jenny Li on 2/4/20.
//  Copyright © 2020 Jenny Li. All rights reserved.
//

import SwiftUI

struct GuessNumber: View {
    @State private var answer = Int.random(in: 0...100)
    @State private var guessedNumber = ""
    @State private var resultTitle = ""
    @State private var showingAlert = false
    @State private var tried = 0
    @State private var flipped = false

    var body: some View {
    
       ZStack {
              Color(red:0.67, green:0.78, blue:0.87).edgesIgnoringSafeArea(.all)
                .watermarked(with: "Made with love in NY")

            VStack(spacing:12) {
                Spacer()
                Text("Take a Guess")
                    .font(.largeTitle)
                    .fontWeight(.black)
                .foregroundColor(self.flipped ? .red : .red) // change the card color when flipped

                Text("You guessed \(tried) times")
                    .foregroundColor(self.flipped ? .red : .red) // change the card color when flipped
                TextField("Guess a number", text: $guessedNumber)
                    .font(.system(size: 28))
                    .padding(32)
                    .keyboardType(.numberPad)
                Spacer()
                Button(action: {
                    self.guessTapped()
                }) {
                    Text("Guess 👀")
                    Image(systemName: "arrow.right.circle.fill")
                }.padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(8)


            }.padding()
                .frame(width: 300, height: 300, alignment: .center)
                .background(Color.white)
                .cornerRadius(24)
                .shadow(color: Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.1), radius: 6)

            .rotation3DEffect(self.flipped ? Angle(degrees: 180): Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
            .animation(.default) // implicitly applying animation
            .onTapGesture {
                // explicitly apply animation on toggle (choose either or)
                //withAnimation {
                    self.flipped.toggle()
        }

        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(resultTitle), message: Text("Word"), dismissButton: .default(Text("Continue")) {
                //                self.askQuestion()
                })
       }
    }
    func guessTapped() {
        if Int(guessedNumber) == answer {
            resultTitle = "Correct"
            answer = Int.random(in: 0...10)
            tried = 0
        } else {
            if Int(guessedNumber)! < answer {
                resultTitle = "Too small"
            } else {
                resultTitle = "Too large"
            }
            tried += 1
        }
        showingAlert = true
    }
}

struct GuessNumber_Previews: PreviewProvider {
    static var previews: some View {
        GuessNumber()
    }
}
