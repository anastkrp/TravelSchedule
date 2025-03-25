//
//  CarriersViewModel.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 25.03.2025.
//

import SwiftUI

@MainActor
final class CarriersViewModel: ObservableObject {
    @Published var filteredCarriers: [Carrier] = []
    @Published var carrierInfo = CarrierInfo(code: 0, title: "", logo: "RZD", phone: "", email: "")
    @Published var isLoading: Bool = false
    @Published var isServerError: Bool = false
    private var carriers: [Carrier] = []
    private var carriersInfoAll: [CarrierInfo] = []
    
    @Published var isActiveFilter: Bool = false
    @Published var filter: Filter = Filter(
        morning: false,
        afternoon: false,
        evening: false,
        night: false,
        transferYes: false,
        transferNo: false
    ) {
        didSet {
            isActiveFilter = filter.isActive
            filterCarriers()
        }
    }
    
    // MARK: - CarriersView
    
    // loadCarriers
    
    // MARK: - CarriersInfo
    
    func loadCarrierInfo(code: Int) {
        if let foundCarrier = carriersInfoAll.first(where: { $0.code == code }) {
            carrierInfo = foundCarrier
        }
    }
    
    // MARK: -  FilterView
    
    func filterSelected(_ type: FilterType) {
        filter = Filter(
            morning: type == .morning ? !filter.morning : filter.morning,
            afternoon: type == .afternoon ? !filter.afternoon : filter.afternoon,
            evening: type == .evening ? !filter.evening : filter.evening,
            night: type == .night ? !filter.night : filter.night,
            transferYes: type == .transferYes ? !filter.transferYes : filter.transferYes,
            transferNo: type == .transferNo ? !filter.transferNo : filter.transferNo
        )
    }
    
    func filterCarriers() {
        if isActiveFilter {
            filteredCarriers = carriers.filter { carrier in
                let isActiveFilterTimeDay = filter.morning || filter.afternoon || filter.evening || filter.night
                
                let timeDay = filter.morning && ("06:00"..."11:59").contains(carrier.departureTime.toTimeFormat()) ||
                filter.afternoon && ("12:00"..."17:59").contains(carrier.departureTime.toTimeFormat()) ||
                filter.evening && ("18:00"..."23:59").contains(carrier.departureTime.toTimeFormat()) ||
                filter.night && ("00:00"..."05:59").contains(carrier.departureTime.toTimeFormat()) ||
                !isActiveFilterTimeDay
                
                let isActiveFilterTransfer = filter.transferYes || filter.transferNo
                
                let transfer = filter.transferYes && carrier.transfer ||
                filter.transferNo && !carrier.transfer ||
                !isActiveFilterTransfer
                
                return timeDay && transfer
            }
        } else {
            filteredCarriers = carriers
        }
    }
}
