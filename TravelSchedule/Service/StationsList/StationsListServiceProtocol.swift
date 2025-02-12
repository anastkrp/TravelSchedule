//
//  StationsListServiceProtocol.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 11.02.2025.
//

import Foundation

typealias StationsList = Components.Schemas.StationsList

protocol StationsListServiceProtocol {
    func stationsList() async throws -> StationsList
}
