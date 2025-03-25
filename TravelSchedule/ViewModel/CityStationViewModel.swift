//
//  CityStationViewModel.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 25.03.2025.
//

import SwiftUI

@MainActor
final class CityStationViewModel: ObservableObject {
    @Published var cityWithStations: [StationsByCity] = []
    @Published var stations: [Stations] = []
    @Published var citySelected: String = ""
    @Published var stationSelected = (name: "", code: "")
    @Published var isServerError: Bool = false
    
    
}
