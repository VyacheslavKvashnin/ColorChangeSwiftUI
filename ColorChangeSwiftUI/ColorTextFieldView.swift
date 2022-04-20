//
//  ColorTextFieldView.swift
//  ColorChangeSwiftUI
//
//  Created by Вячеслав Квашнин on 20.04.2022.
//

import SwiftUI

struct ColorTextFieldView: View {
    
    @Binding var dataTextField: Double
    @Binding var valueText: String
    
    @State private var showAlert = false
    
    var body: some View {
        
        TextField("", text: $valueText) { _ in
            validValue()
        }
        .textFieldStyle(.roundedBorder)
        .frame(width: 50)
        .multilineTextAlignment(.trailing)
        .onChange(of: dataTextField) { _ in
            guard dataTextField >= 256 else { return }
            showAlert.toggle()
        }
        .alert("Wrong Number!!!", isPresented: $showAlert) {
            Button("OK") {
                dataTextField = 255
            }
        }
    }
    
    private func validValue() {
        if let value = Double(valueText) {
            self.dataTextField = value
        }
    }
}

struct ColorTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        ColorTextFieldView(dataTextField: .constant(2.0), valueText: .constant(""))
    }
}
