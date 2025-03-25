//
//  StationsListService.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 11.02.2025.
//

import OpenAPIRuntime
import OpenAPIURLSession

struct StationsListService: StationsListServiceProtocol {
    private let networkClient = NetworkClient()
    
    func stationsList() async throws -> StationsList {
        try await networkClient.fetchStationList()
    }
}
