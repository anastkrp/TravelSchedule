//
//  StationsListService.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 11.02.2025.
//

import OpenAPIRuntime
import OpenAPIURLSession
import Foundation

final class StationsListService: StationsListServiceProtocol {
    private let client: Client
    
    init(client: Client) {
        self.client = client
    }
    
    func stationsList() async throws -> StationsList {
        let response = try await client.stationsList(query: .init())
        let httpBody = try response.ok.body.html
        let buffer = try await Data(collecting: httpBody, upTo: Constants.bufferSize)
        print("Response size: \(buffer)")
        return try JSONDecoder().decode(StationsList.self, from: buffer)
    }
}
