//
//  ContentView.swift
//  Flag Guessing
//
//  Created by Simon Wheatcroft on 29/04/2024.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private     var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var userScore = 0
    @State private var roundCount = 0
    
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text("Guess the flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                    
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                            
                        //vstack end
                    }
                    ForEach(0..<3)  { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                RadialGradient(stops: [
                    .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                    .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
                ], center: .top, startRadius: 200, endRadius: 400)
                
                .ignoresSafeArea()
                Spacer()
                Spacer()
                Text("Your score is \(userScore)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
            //zstack end
        }
        .alert(scoreTitle, isPresented: $showingScore ) {
            
            if roundCount == 2 {
                Button("reset", action: roundReset)
            } else {
                Button("OK", action: askQuestion)
            }
        } message: {
            if scoreTitle == "Correct" {
Text("Correct, your score is \(userScore)")
                
            } else {
Text("Wrong, your score is \(userScore)")
                
            }
            
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            userScore += 100
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        roundCount += 1
    }
    
    func roundReset() {
        roundCount = 0
    }
}



#Preview {
    ContentView()
}
