//
//  CityStations.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 26.02.2025.
//

import Foundation

struct CityStations: Identifiable, Hashable {
    let id = UUID()
    let city: String
    let stations: [String]
}
