//
//  NearestStationsServiceProtocol.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 08.02.2025.
//

import Foundation

typealias NearestStations = Components.Schemas.Stations

protocol NearestStationsServiceProtocol {
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations
}
