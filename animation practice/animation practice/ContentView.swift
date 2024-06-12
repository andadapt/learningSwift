//
//  ContentView.swift
//  animation practice
//
//  Created by Simon Wheatcroft on 08/05/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack {
            Text("❤️")
                .font(.title)
                .animation(
                    .easeInOut(duration: 1)
                        .repeatForever(autoreverses: false),
                    value: animationAmount
                )
                .onAppear {
                    animationAmount = 2
                }
                
                
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
