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
                    .frame(width: Constants.logoCarrierSize, height: Constants.logoCarrierSize)
                VStack(alignment: .leading) {
                    Text(carrier.carrierTitle)
                        .foregroundStyle(.blackUniversal)
                    Text(carrier.transfer ? "С пересадкой" : "")
                        .font(.caption)
                        .foregroundStyle(.redUniversal)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Text(carrier.departureDay)
                    .font(.caption)
                    .foregroundStyle(.blackUniversal)
                    .tracking(Constants.letterSpacing)
                    
            }
            .padding([.top, .horizontal], Constants.paddingMedium)
            
            HStack {
                Text(carrier.departureTime)
                    .foregroundStyle(.blackUniversal)
                VStack {
                    Divider()
                        .overlay(.grayUniversal)
                }
                Text("\(carrier.duration / Constants.secondsInHour) hour")
                    .font(.caption)
                    .foregroundStyle(.blackUniversal)
                    .tracking(Constants.letterSpacing)
                VStack {
                    Divider()
                        .overlay(.grayUniversal)
                }
                Text(carrier.arrivalTime)
                    .foregroundStyle(.blackUniversal)
            }
            .padding(Constants.paddingMedium)
        }
        .background() {
            RoundedRectangle(cornerRadius: Constants.cornerRadiusLarge)
                .fill(.lightGrayTS)
        }
        .padding(.horizontal)
    }
}

#Preview {
    CarrierRow(carrier: .init(
        code: 1,
        carrierTitle: "РЖД",
        carrierLogo: "rhk",
        departureDay: "14 января",
        departureTime: "22:30",
        arrivalTime: "08:15",
        duration: 72000,
        transfer: true
    ))
}
