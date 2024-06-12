//
//  ContentView.swift
//  Conversion App
//
//  Created by Simon Wheatcroft on 28/04/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputUnit = "mm"
    @State private var outputUnit = "cm"
    let unitsToConvert = ["mm", "cm", "m", "km"]
    @State private var amountToConvert = 0.0
    
    //var to get base unit
    var baseUnit: Double {
        if inputUnit == "cm" {
            return amountToConvert * 10
        } else if inputUnit == "m" {
            return amountToConvert * 1000
        } else if inputUnit == "km" {
            return amountToConvert * 1000000
        } else {
            return amountToConvert
        }
    }
    
    //var to calculate output
    var unitConverted: Double {
        if outputUnit == "cm" {
            return baseUnit / 10
        } else if outputUnit == "m" {
            return baseUnit / 1000
        } else if outputUnit == "km" {
            return baseUnit / 1000000
        } else {
            return baseUnit
        }
    }
    var body: some View {
        NavigationStack {
            Form {
                Section("Input unit") {
                    Picker("Input unit", selection: $inputUnit) {
                        ForEach(unitsToConvert, id: \.self) {
                            Text($0)
                        }
                        .pickerStyle(.menu)
                    }
                }
                
                Section {
                    TextField("Convert", value: $amountToConvert, format: .number)
                }
                
                Section("Output unit") {
                    Picker("Output unit", selection: $outputUnit){
                        ForEach(unitsToConvert, id: \.self) {
                            Text($0)
                        }
                        .pickerStyle(.segmented)
                    }
                }
                
                Section {
                    Text("Your output is \(unitConverted)" )
                }
                //form end
            }
            .navigationTitle("Conversion App")
            //nav end
        }
    }
}

#Preview {
    ContentView()
}
