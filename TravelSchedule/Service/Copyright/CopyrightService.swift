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
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getCopyright() async throws -> Copyright {
        let response = try await client.getCopyright(query: .init(
            apikey: apikey
        ))
        return try response.ok.body.json
    }
}
