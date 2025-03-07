//
//  Checkbox.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 07.03.2025.
//

import SwiftUI

struct Checkbox: ToggleStyle {
    let checkboxType: CheckboxType
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Image(systemName: checkboxType.checkboxImage(configuration.isOn))
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
