//
//  CheckboxSquare.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 03.03.2025.
//

import SwiftUI

struct CheckboxSquare: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: Constants.iconSizeLarge, height: Constants.iconSizeLarge)
                .tint(.blackTS)
        }
        .frame(height: Constants.rowHeight)
        .padding(.horizontal)
        .onTapGesture {
            configuration.isOn.toggle()
        }
    }
}
