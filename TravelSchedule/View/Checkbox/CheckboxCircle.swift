//
//  CheckboxCircle.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 03.03.2025.
//

import SwiftUI

struct CheckboxCircle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
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
