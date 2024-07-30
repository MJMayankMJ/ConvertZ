//
//  ContentView.swift
//  Convertz
//
//  Created by Mayank Jangid on 7/30/24.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = 0.0
    @State private var inputTemperatureType = "°C"
    @State private var outputTemperatureType = "°F"
    
    let temperatureTypes = ["°C", "°F", "°K"]
    var outputValue : Double {
        
        if inputTemperatureType == "°C" {
            inputValue = inputValue
        }
        else if inputTemperatureType == "°F" {
            inputValue = (inputValue - 32) * (5 / 9)
        }
        else if inputTemperatureType == "°K" {
            inputValue = inputValue - 273.15
        }
        else {
            print("error")
        }
        
        if outputTemperatureType == "°C" {
            return inputValue
        }
        else if outputTemperatureType == "°F" {
            return ((inputValue * (9/5)) + 32)
        }
        else if outputTemperatureType == "°K" {
            return (inputValue - 273.15)
        }
        else {
            print("error")
            return 0
        }
    }
    
    var body: some View {
        NavigationStack {
            Form{
                Section("Input Temp."){
                    HStack {
                        TextField("Input Value", value: $inputValue, format: .number)
                        Picker("Temp.", selection: $inputTemperatureType) {
                            ForEach(temperatureTypes, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(.segmented)
                        
                    }
                }
                Section("Output Temp."){
                    HStack{
                        Text(outputValue, format: .number)
                        Spacer(minLength: 150)
                        Picker("Temp.", selection: $outputTemperatureType) {
                            ForEach(temperatureTypes, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(.segmented)
                        
                    }
                }
            }
            .navigationTitle("ConvertZ")
        }
    }
}

#Preview {
    ContentView()
}
