//
//  CarrierRow.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 01.03.2025.
//

import SwiftUI

struct CarrierRow: View {
    
    // MARK: - Properties
    
    let carrier: Carrier

    // MARK: - Content
    
    var body: some View {
        VStack(spacing: 0.0) {
            HStack(alignment: .top) {
                logoCarrier(carrier.carrierLogo)
                carrierTitleView(title: carrier.carrierTitle, transfer: carrier.transfer)
                departureDayView(carrier.departureDay)
            }
            .padding([.top, .horizontal], Constants.paddingMedium)
            timeView(
                departureTime: carrier.departureTime,
                duration: carrier.duration,
                arrivalTime: carrier.arrivalTime
            )
        }
        .background() {
            RoundedRectangle(cornerRadius: Constants.cornerRadiusLarge)
                .fill(.lightGrayTS)
        }
        .padding(.horizontal)
    }
    
    // MARK: - View
    
    private func logoCarrier(_ logo: String) -> some View {
        AsyncImage(url: URL(string: logo)) { phase in
            switch phase {
            case .success(let image):
                RoundedRectangle(cornerRadius: 12)
                    .fill(.whiteUniversal)
                    .frame(width: Constants.logoCarrierSize, height: Constants.logoCarrierSize)
                    .overlay(
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    )
            case .failure, .empty:
                RoundedRectangle(cornerRadius: 12)
                    .fill(.whiteUniversal)
                    .frame(width: Constants.logoCarrierSize, height: Constants.logoCarrierSize)
            default:
                ProgressView()
                    .frame(width: Constants.logoCarrierSize, height: Constants.logoCarrierSize)
            }
        }
    }
    
    private func carrierTitleView(title: String, transfer: Bool) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundStyle(.blackUniversal)
            Text(transfer ? "С пересадкой" : "")
                .font(.caption)
                .foregroundStyle(.redUniversal)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func departureDayView(_ day: String) -> some View {
        Text(day.toDayFormat())
            .font(.caption)
            .foregroundStyle(.blackUniversal)
            .tracking(Constants.letterSpacing)
    }
    
    private func timeView(departureTime: String, duration: Int, arrivalTime: String) -> some View {
        HStack {
            Text(departureTime.toTimeFormat())
                .foregroundStyle(.blackUniversal)
            VStack {
                Divider()
                    .overlay(.grayUniversal)
            }
            Text("\(duration / Constants.secondsInHour) hour")
                .font(.caption)
                .foregroundStyle(.blackUniversal)
                .tracking(Constants.letterSpacing)
            VStack {
                Divider()
                    .overlay(.grayUniversal)
            }
            Text(arrivalTime.toTimeFormat())
                .foregroundStyle(.blackUniversal)
        }
        .padding(Constants.paddingMedium)
    }
}

#Preview {
    CarrierRow(carrier: .init(
        code: 1,
        carrierTitle: "РЖД",
        carrierLogo: "rhk",
        departureDay: "2025-03-24",
        departureTime: "2025-03-24T00:17:00+03:00",
        arrivalTime: "2025-03-24T08:00:00+03:00",
        duration: 30000,
        transfer: true
    ))
}
