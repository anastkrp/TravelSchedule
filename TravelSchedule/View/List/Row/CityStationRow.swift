//
//  CityStationRow.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 28.02.2025.
//

import SwiftUI

struct CityStationRow: View {
    let titleRow: String
    
    var body: some View {
        HStack {
            Text(titleRow)
                .foregroundStyle(.blackTS)
                .lineLimit(1)
            Spacer()
            Image(systemName: "chevron.right")
                .resizable()
                .scaledToFit()
                .frame(width: Constants.iconWidth, height: Constants.iconHeight)
                .tint(.blackTS)
        }
        .padding(.horizontal)
        .frame(height: Constants.rowHeight)
        .contentShape(Rectangle())
    }
}

#Preview {
    CityStationRow(titleRow: "Москва")
}
