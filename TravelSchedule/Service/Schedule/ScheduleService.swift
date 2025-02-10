//
//  ScheduleService.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 10.02.2025.
//

import OpenAPIRuntime
import OpenAPIURLSession

final class ScheduleService: ScheduleServiceProtocol {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func schedule(station: String, date: String) async throws -> Schedule {
        let response = try await client.schedule(query: .init(
            apikey: apikey,
            station: station,
            date: date
        ))
        return try response.ok.body.json
    }
}
