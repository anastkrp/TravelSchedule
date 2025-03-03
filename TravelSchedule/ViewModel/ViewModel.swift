//
//  ViewModel.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 02.03.2025.
//

import Foundation

final class ViewModel: ObservableObject {
    var carriers: [Carrier] = []
    
    @Published var cityStations: [CityStations] = []
    @Published var filteredCarriers: [Carrier] = []
    
    @Published var direction: Direction = .from
    
    @Published var citySelected: String = ""
    @Published var stationSelected: String = ""
    @Published var from: String = ""
    @Published var to: String = ""
    
    @Published var onSearch: Bool = false
    @Published var destinationTitle: String = ""
    
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
            isActiveFilter = filter.isActive()
            filterCarriers()
        }
    }
    
    // MARK: - Load Data
    
    func loadCityStations() {
        if cityStations.isEmpty {
            cityStations = MockData.cityStationsMock
        }
    }
    
    func loadCarriers() {
        if carriers.isEmpty {
            carriers = MockData.carriersMock
            filterCarriers()
        }
    }
    
    // MARK: - MainView
    
    func swapDestination() {
        if !from.isEmpty && !to.isEmpty {
            swap(&from, &to)
        }
    }
    
    // MARK: - StationsView
    
    func addDestination() {
        switch direction {
        case .from:
            from = "\(citySelected) (\(stationSelected))"
        case .to:
            to = "\(citySelected) (\(stationSelected))"
        }
        
        if !from.isEmpty && !to.isEmpty {
            destinationTitle = from + " → " + to
            onSearch = true
        }
        
        citySelected = ""
        stationSelected = ""
    }
    
    // MARK: -  FilterView
    
    func filterCarriers() {
        if isActiveFilter {
            filteredCarriers = carriers.filter { carrier in
                let isActiveFilterTimeDay = filter.morning || filter.afternoon || filter.evening || filter.night
                
                let timeDay = filter.morning && ("06:00"..."11:59").contains(carrier.departureTime) ||
                filter.afternoon && ("12:00"..."17:59").contains(carrier.departureTime) ||
                filter.evening && ("18:00"..."23:59").contains(carrier.departureTime) ||
                filter.night && ("00:00"..."05:59").contains(carrier.departureTime) ||
                !isActiveFilterTimeDay
                
                let isActiveFilterTransfer = filter.transferYes || filter.transferNo
                
                let transfer = filter.transferYes && !carrier.transfer.isEmpty ||
                filter.transferNo && carrier.transfer.isEmpty ||
                !isActiveFilterTransfer
                
                return timeDay && transfer
            }
        } else {
            filteredCarriers = carriers
        }
    }
}
