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
        VStack() {
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
            .modifier(NavigationBarStyle(title: ""))
        }
    }
}
