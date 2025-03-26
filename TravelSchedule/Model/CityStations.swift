//
//  CityStations.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 26.02.2025.
//

import Foundation

struct StationsByCity: Identifiable, Hashable, Sendable {
    let id = UUID()
    let cityName: String
    let stations: [Stations]
}
struct Stations: Identifiable, Hashable, Sendable {
    let id = UUID()
    let stationName: String
    let code: String
}
