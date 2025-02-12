//
//  CopyrightService.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 09.02.2025.
//

import OpenAPIRuntime
import OpenAPIURLSession

final class CopyrightService: CopyrightServiceProtocol {
    private let client: Client
    
    init(client: Client) {
        self.client = client
    }
    
    func getCopyright() async throws -> Copyright {
        let response = try await client.getCopyright(query: .init())
        return try response.ok.body.json
    }
}
