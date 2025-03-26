//
//  CarrierInfoView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 04.03.2025.
//

import SwiftUI

struct CarrierInfoView: View {
    @EnvironmentObject private var carriersViewModel: CarriersViewModel
    let carrierCode: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            carrierLogo
            Text(carriersViewModel.carrierInfo.title)
                .font(.system(size: 24, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.horizontal, .bottom])
            
            InfoRow(type: InfoRowType.mail, link: carriersViewModel.carrierInfo.email)
            InfoRow(type: InfoRowType.phone, link: carriersViewModel.carrierInfo.phone)
            
            Spacer()
            
            .modifier(NavigationBarStyle(title: "Информация о перевозчике"))
        }
        .background(.whiteTS)
        .onAppear() {
            carriersViewModel.loadCarrierInfo(code: carrierCode)
        }
    }
    
    private var carrierLogo: some View {
        AsyncImage(url: URL(string: carriersViewModel.carrierInfo.logo)) { phase in
            switch phase {
            case .success(let image):
                RoundedRectangle(cornerRadius: Constants.cornerRadiusLarge)
                    .fill(.whiteUniversal)
                    .frame(maxWidth: .infinity, maxHeight: Constants.logoCarrierHeight)
                    .overlay(
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    )
            case .failure, .empty:
                RoundedRectangle(cornerRadius: Constants.cornerRadiusLarge)
                    .fill(.whiteUniversal)
                    .frame(maxWidth: .infinity, maxHeight: Constants.logoCarrierHeight)
            default:
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: Constants.logoCarrierHeight)
            }
        }
        .padding()
    }
}
