//
//  CarriersView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 01.03.2025.
//

import SwiftUI

struct CarriersView: View {
    @StateObject var viewModel: CarriersViewModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Text(viewModel.destinationTitle)
                    .font(.system(size: 24, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ListCarrier(
                    isEmptyData: viewModel.carriers.isEmpty,
                    emptyTitle: "Вариантов нет"
                ) {
                    ForEach(viewModel.carriers) { carrier in
                        CarrierRow(carrier: carrier)
                    }
                }
            }
            
            Button(action: {}) {
                HStack {
                    Text("Уточнить время")
                        .fontWeight(.bold)
                        .foregroundStyle(.whiteUniversal)
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: Constants.iconSizeSmall, height: Constants.iconSizeSmall)
                        .foregroundStyle(.redUniversal)
                }
                .frame(maxWidth: .infinity, maxHeight: Constants.buttonHeight)
                .background() {
                    RoundedRectangle(cornerRadius: Constants.cornerRadiusMedium)
                        .fill(.blueUniversal)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, Constants.paddingLarge)
        }
        .modifier(NavigationBarStyle(title: ""))
    }
}
