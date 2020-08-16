//
//  RockPaperScissor.swift
//  30DaySwiftUI
//
//  Created by Jenny Li on 2/6/20.
//  Copyright © 2020 Jenny Li. All rights reserved.
//

/*
 1. Each turn of the game the app will randomly pick either rock, paper or scissors.
 2. Each turn the app will either prompt the player to win or lose.
 3. The player must then tap the correct move to win or lose the game.
 4. If they are correct they score a point; otherwise they lose a point.
 5. The game ends after 10 questions, at which point their score is shown.
 */

import SwiftUI

struct RockPaperScissor: View {
    @State private var choices = ["Rock", "Paper", "Scissors"]
    @State private var appChoice = Int.random(in: 0...3)
    @State private var userChoice = 0
    @State private var score = 0
    @State private var resultTitle = ""
    @State private var rounds = 0
    @State private var showingAlert = false
    
    var body: some View {
        ZStack {
            VStack {
                Text("Rock Paper Scissors")
                Text(choices[appChoice])
                Text("Score: \(score)")
                Button(action: {self.results(0)}){
                    Text("Rock")
                }
                Button(action: {self.results(1)}){
                    Text("Paper")
                }
                Button(action: {self.results(2)}){
                    Text("Scissor")
                }
            }
        } .alert(isPresented: $showingAlert) {
            Alert(title: Text(resultTitle), message: Text("Word"), dismissButton: .default(Text("Continue")) {
                //                self.askQuestion()
                })
        }
    }
    func results(_ userChoice: Int) {
        if userChoice == 1 && appChoice == 0 {
            score += 1
            resultTitle = "You Win!"
        } else if userChoice == 0 && appChoice == 1 {
            resultTitle = "Oops...Try Again"
        } else {
            score += 1
            resultTitle = "You Win!"
        }
        rounds += 1
        appChoice = Int.random(in: 0...3)
        
        showingAlert = true
    }
}

struct RockPaperScissor_Previews: PreviewProvider {
    static var previews: some View {
        RockPaperScissor()
    }
}
