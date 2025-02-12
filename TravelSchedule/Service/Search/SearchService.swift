//
//  SearchService.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 10.02.2025.
//

import OpenAPIRuntime
import OpenAPIURLSession

final class SearchService: SearchServiceProtocol {
    private let client: Client
    
    init(client: Client) {
        self.client = client
    }
    
    func search(from: String, to: String, date: String) async throws -> Search {
        let response = try await client.search(query: .init(
            from: from,
            to: to,
            date: date
        ))
        return try response.ok.body.json
    }
}
