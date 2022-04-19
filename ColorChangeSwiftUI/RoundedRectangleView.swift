//
//  RoundedRectangleView.swift
//  ColorChangeSwiftUI
//
//  Created by Вячеслав Квашнин on 19.04.2022.
//

import SwiftUI

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

struct RoundedRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectangleView(redColor: 255.0, blueColor: 255.0, greenColor: 255.0)
    }
}
