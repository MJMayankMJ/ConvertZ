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
    var input = inputValue
        //this is done to prevent "Modifying state during view update, this will cause undefined behavior." error
        //u cant change state property at the runtime u can change it before but not at runtime (atleast thats what i think it is)
        //so just creat a seperate var instead
        
        if inputTemperatureType == "°C" {
            
        }
        else if inputTemperatureType == "°F" {
            input = (input - 32) * (5 / 9)
        }
        else if inputTemperatureType == "°K" {
            input = input - 273.15
        }
        else {
            print("error")
        }
        
        if outputTemperatureType == "°C" {
            return input
        }
        else if outputTemperatureType == "°F" {
            return ((input * (9/5)) + 32)
        }
        else if outputTemperatureType == "°K" {
            return (input - 273.15)
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
