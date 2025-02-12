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
    
    init(client: Client) {
        self.client = client
    }
    
    func schedule(station: String, date: String) async throws -> Schedule {
        let response = try await client.schedule(query: .init(
            station: station,
            date: date
        ))
        return try response.ok.body.json
    }
}
