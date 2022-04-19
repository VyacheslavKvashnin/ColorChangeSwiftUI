//
//  ColorTextLabelView.swift
//  ColorChangeSwiftUI
//
//  Created by Вячеслав Квашнин on 19.04.2022.
//

import SwiftUI

struct ColorTextLabelView: View {
    let dataTextLabel: Double
    
    var body: some View {
        Text("\(lround(dataTextLabel))")
            .frame(width: 40)
            .foregroundColor(.white)
    }
}

struct ColorTextLabelView_Previews: PreviewProvider {
    static var previews: some View {
        ColorTextLabelView(dataTextLabel: 25.0)
    }
}
