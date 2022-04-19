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
               
                ColorSliderView(color: $redColor, dataTextField: $redColor, dataTextLabel: redColor)
                    .tint(.red)
                ColorSliderView(color: $blueColor, dataTextField: $blueColor, dataTextLabel: blueColor)
                    .tint(.blue)
                ColorSliderView(color: $greenColor, dataTextField: $greenColor, dataTextLabel: greenColor)
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
    
    let dataTextLabel: Double
    
    var body: some View {
        HStack {
            ColorTextLabelView(dataTextLabel: dataTextLabel)
                
            Slider(value: $color, in: 0...255)
                
            ColorTextFieldView(dataTextField: $dataTextField)
        }
        .padding()
    }
}


struct ColorTextFieldView: View {
    @Binding var dataTextField: Double
    @State private var showAlert = false
    
    var body: some View {
        TextField("", value: $dataTextField, formatter: NumberFormatter())
            .onSubmit {
                guard dataTextField >= 256 else { return }
                showAlert.toggle()
            }
            .textFieldStyle(.roundedBorder)
            .frame(width: 50)
            .multilineTextAlignment(.trailing)
            .alert("Wrong Number!!!", isPresented: $showAlert) {
                Button("OK") {
                    dataTextField = 0
                }
            }
    }
}


