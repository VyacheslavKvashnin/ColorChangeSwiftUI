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
                
                ColorSliderGroupView(dataTextField: $redColor, tintColor: .red)
                ColorSliderGroupView(dataTextField: $blueColor, tintColor: .blue)
                ColorSliderGroupView(dataTextField: $greenColor, tintColor: .green)
                
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
