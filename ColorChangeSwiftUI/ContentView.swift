//
//  ContentView.swift
//  ColorChangeSwiftUI
//
//  Created by Вячеслав Квашнин on 19.04.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redColor = Double.random(in: 0...255)
    @State private var blueColor = Double.random(in: 0...255)
    @State private var greenColor = Double.random(in: 0...255)
    
    @FocusState private var focusedField: Bool
    
    var body: some View {
        ZStack {
            Color.purple.ignoresSafeArea()
                .onTapGesture {
                    focusedField = false
                }
            VStack {
                RoundedRectangleView(
                    redColor: redColor,
                    blueColor: blueColor,
                    greenColor: greenColor
                )
               
                ColorSliderView(color: $redColor, dataTextField: $redColor)
                    .tint(.red)
                ColorSliderView(color: $blueColor, dataTextField: $blueColor)
                    .tint(.blue)
                ColorSliderView(color: $greenColor, dataTextField: $greenColor)
                    .tint(.green)
                
                Spacer()
                
            }
            .keyboardType(.numberPad)
            .focused($focusedField)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        focusedField = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorSliderView: View {
    
    @Binding var color: Double
    @Binding var dataTextField: Double
    
    var body: some View {
        HStack {
            Text("\(lround(dataTextField))")
                .frame(width: 40)
                .foregroundColor(.white)
                
            Slider(value: $color, in: 0...255)
                
            TextField("", value: $dataTextField, formatter: NumberFormatter())
                .textFieldStyle(.roundedBorder)
                .frame(width: 50)
                .multilineTextAlignment(.trailing)
        }
        .padding()
    }
}

struct RoundedRectangleView: View {
    
    let redColor: Double
    let blueColor: Double
    let greenColor: Double
    
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .fill(Color(red: redColor / 255, green: greenColor / 255, blue: blueColor / 255))
            .frame(width: 300, height: 200)
            .overlay(RoundedRectangle(cornerRadius: 30).stroke(.white, lineWidth: 3))
            .padding([.top, .bottom], 20)
    }
}
