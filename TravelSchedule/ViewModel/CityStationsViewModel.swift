//
//  CityStationsViewModel.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 26.02.2025.
//

import Foundation

final class CityStationsViewModel: ObservableObject {
    @Published var cityStations: [CityStations] = []
    
    init() {
        self.cityStations = MockData.cityStationsMock
    }
}
