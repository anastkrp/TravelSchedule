//
//  DirectionViewModel.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 28.02.2025.
//

import Foundation

final class DirectionViewModel: ObservableObject {
    @Published var cityStations: [CityStations] = []
    @Published var direction: Direction = .from
    
    @Published var citySelected: String = ""
    @Published var stationSelected: String = ""
    
    @Published var from: String = ""
    @Published var to: String = ""
    
    func loadData() {
        cityStations = MockData.cityStationsMock
    }
    
    func swapDestination() {
        if !from.isEmpty && !to.isEmpty {
            swap(&from, &to)
        }
    }
    
    func addDestination() {
        switch direction {
        case .from:
            from = "\(citySelected) (\(stationSelected))"
        case .to:
            to = "\(citySelected) (\(stationSelected))"
        }
        citySelected = ""
        stationSelected = ""
    }
}
