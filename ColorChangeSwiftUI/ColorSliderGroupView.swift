//
//  ColorSliderGroupView.swift
//  ColorChangeSwiftUI
//
//  Created by Вячеслав Квашнин on 20.04.2022.
//

import SwiftUI

struct ColorSliderGroupView: View {
    
    @Binding var dataTextField: Double
    @State private var textValue = ""
    
    let tintColor: Color
    
    var body: some View {
        HStack {
            ColorTextLabelView(dataTextLabel: dataTextField)
            SliderView(color: $dataTextField)
            ColorTextFieldView(dataTextField: $dataTextField, valueText: $textValue)
        }
        .tint(tintColor)
        .onChange(of: dataTextField, perform: { newValue in
            textValue = "\(lround(newValue))"
        })
        .onAppear(perform: {
            textValue = "\(lround(dataTextField))"
        })
        .padding()
    }
}

struct ColorSliderGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderGroupView(dataTextField: .constant(2.0), tintColor: .red)
    }
}
