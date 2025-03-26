//
//  CarriersView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 01.03.2025.
//

import SwiftUI

struct CarriersView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject private var carriersViewModel: CarriersViewModel
    @EnvironmentObject private var router: Router
    
    let destinationTitle: String
    let codeFrom: String
    let codeTo: String
    
    // MARK: - Content
    
    var body: some View {
        content
            .task {
                await carriersViewModel.loadCarriers(codeFrom: codeFrom, codeTo: codeTo)
            }
            .onDisappear {
                if router.path.isEmpty {
                    carriersViewModel.clearData()
                }
            }
    }
    
    // MARK: - View
    
    private var content: some View {
        VStackErrorHandling(errorType: carriersViewModel.isServerError ? .serverError : .none) {
            ZStack(alignment: .bottom) {
                carriersListView
                filterButtonView
            }
        }
        .background(.whiteTS)
        .modifier(NavigationBarStyle(title: ""))
    }
    
    private var carriersListView: some View {
        VStack {
            Text(destinationTitle)
                .font(.system(size: 24, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            ListCarrier(
                isEmptyData: carriersViewModel.filteredCarriers.isEmpty,
                emptyTitle: "Вариантов нет",
                isLoading: carriersViewModel.isLoading
            ) {
                ForEach(carriersViewModel.filteredCarriers) { carrier in
                    CarrierRow(carrier: carrier)
                        .onTapGesture {
                            router.push(.carrierInfo(carrier.code))
                        }
                }
            }
        }
    }
    
    private var filterButtonView: some View {
        Button(action: { router.push(.filter) }) {
            HStack {
                Text("Уточнить время")
                    .fontWeight(.bold)
                    .foregroundStyle(.whiteUniversal)
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: Constants.iconSizeSmall, height: Constants.iconSizeSmall)
                    .foregroundStyle(.redUniversal)
                    .opacity(carriersViewModel.isActiveFilter ? 1 : 0)
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
}
