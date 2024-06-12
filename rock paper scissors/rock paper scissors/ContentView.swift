//
//  ContentView.swift
//  rock paper scissors
//
//  Created by Simon Wheatcroft on 01/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    let possibleMoves = ["🪨", "🧻", "✂️"]
    let winningMoves = ["🧻", "✂️", "🪨"]
    @State private var currentChoice = Int.random(in: 0..<3)
    @State private var winOrLose = true
    @State private var userScore = 0
    @State private var roundCount = 0
    
    
    var body: some View {
        NavigationStack {
            VStack {
                if winOrLose {
                    Text("You need to win!")

                } else {
                    Text("You need to lose!")

                }
                
                Text("CPU Choice \(possibleMoves[currentChoice])")
                Text("more text\(userScore)")


            }
            
            VStack {
                ForEach(0..<3) { number in
                    Button {
                        checkAnswer(number: number)
                        
                    } label: {
                        Text(winningMoves[number])
                    }
                }
            }
            
            .navigationTitle("🪨🧻✂️")
        }
    }
    
    func checkAnswer(number: Int) {
        if winOrLose  {
            if number == currentChoice  {
                userScore += 100
            } else if !winOrLose {
                if number != currentChoice  {
                    userScore += 100
                } else {
                    userScore = userScore
                }
            }
        }
        
        currentChoice = Int.random(in: 0..<3)
        winOrLose.toggle()
    }
    
}

#Preview {
    ContentView()
}
