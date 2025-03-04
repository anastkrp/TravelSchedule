//
//  CarriersView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 01.03.2025.
//

import SwiftUI

struct CarriersView: View {
    @EnvironmentObject private var viewModel: ViewModel
    @EnvironmentObject private var router: Router
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Text(viewModel.destinationTitle)
                    .font(.system(size: 24, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ListCarrier(
                    isEmptyData: viewModel.filteredCarriers.isEmpty,
                    emptyTitle: "Вариантов нет"
                ) {
                    ForEach(viewModel.filteredCarriers) { carrier in
                        CarrierRow(carrier: carrier)
                            .onTapGesture {
                                router.push(.carrierInfo(carrier.code))
                            }
                    }
                }
            }

            Button(action: { router.push(.filter) }) {
                HStack {
                    Text("Уточнить время")
                        .fontWeight(.bold)
                        .foregroundStyle(.whiteUniversal)
                    if viewModel.isActiveFilter {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: Constants.iconSizeSmall, height: Constants.iconSizeSmall)
                            .foregroundStyle(.redUniversal)
                    }
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
        .background(.whiteTS)
        .modifier(NavigationBarStyle(title: ""))
        .onAppear {
            viewModel.loadCarriers()
        }
    }
}
