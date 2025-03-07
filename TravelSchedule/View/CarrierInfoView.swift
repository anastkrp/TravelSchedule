//
//  CarrierInfoView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 04.03.2025.
//

import SwiftUI

struct CarrierInfoView: View {
    @EnvironmentObject private var viewModel: ViewModel
    let carrierCode: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(viewModel.carrierInfo.logo)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: 104)
                .background {
                    RoundedRectangle(cornerRadius: Constants.cornerRadiusLarge)
                        .fill(.whiteUniversal)
                }
                .padding()
            
            Text(viewModel.carrierInfo.title)
                .font(.system(size: 24, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.horizontal, .bottom])
            
            InfoRow(type: InfoRowType.mail, link: viewModel.carrierInfo.email)
            InfoRow(type: InfoRowType.phone, link: viewModel.carrierInfo.phone)
            
            Spacer()
            
            .modifier(NavigationBarStyle(title: "Информация о перевозчике"))
        }
        .background(.whiteTS)
        .onAppear() {
            viewModel.loadCarrierInfo(code: carrierCode)
        }
    }
}
