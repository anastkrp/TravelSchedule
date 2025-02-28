//
//  NameDestination.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 21.02.2025.
//

import SwiftUI

struct NameDestination: View {
    let name: String
    let placeholder: String
    
    var body: some View {
        Text(name.isEmpty ? placeholder : name)
            .lineLimit(1)
            .foregroundColor(name.isEmpty ? Color("GrayUniversal") : Color("BlackUniversal"))
            .frame(
                maxWidth: .infinity,
                minHeight: Constants.textHeight,
                alignment: .leading
            )
            .padding(.horizontal)
            .contentShape(Rectangle())
    }
}

#Preview {
    NameDestination(name: "", placeholder: "Откуда")
}
