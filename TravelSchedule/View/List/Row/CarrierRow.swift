//
//  CarrierRow.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 01.03.2025.
//

import SwiftUI

struct CarrierRow: View {
    let carrier: Carrier

    var body: some View {
        VStack(spacing: 0.0) {
            HStack(alignment: .top) {
                Image(carrier.carrierLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 38, height: 38)
                VStack(alignment: .leading) {
                    Text(carrier.carrierTitle)
                    Text(carrier.transfer)
                        .font(.caption)
                        .foregroundColor(.redUniversal)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Text(carrier.departureDay)
                    .font(.caption)
                    .tracking(0.4)
                    
            }
            .padding([.top, .leading, .trailing], 14.0)
            
            HStack {
                Text(carrier.departureTime)
                VStack {
                    Divider()
                        .overlay(.grayUniversal)
                }
                Text("\(carrier.duration / 3600) hour")
                    .font(.caption)
                    .tracking(0.4)
                VStack {
                    Divider()
                        .overlay(.grayUniversal)
                }
                Text(carrier.arrivalTime)
            }
            .padding(.all, 14.0)
        }
        .background() {
            RoundedRectangle(cornerRadius: 24)
                .fill(.lightGrayTS)
        }
        .padding(.horizontal)
    }
}

#Preview {
    CarrierRow(carrier: .init(
        carrierTitle: "РЖД",
        carrierLogo: "rhk",
        departureDay: "14 января",
        departureTime: "22:30",
        arrivalTime: "08:15",
        duration: 72000,
        transfer: "С пересадкой в Костроме"
    ))
}
