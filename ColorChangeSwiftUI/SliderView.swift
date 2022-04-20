//
//  SliderView.swift
//  ColorChangeSwiftUI
//
//  Created by Вячеслав Квашнин on 20.04.2022.
//

import SwiftUI

struct SliderView: View {
    @Binding var color: Double
    
    var body: some View {
        Slider(value: $color, in: 0...255)
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(color: .constant(2.0))
    }
}
