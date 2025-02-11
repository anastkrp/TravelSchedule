//
//  ThreadService.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 11.02.2025.
//

import OpenAPIRuntime
import OpenAPIURLSession

final class ThreadService: ThreadServiceProtocol {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func thread(uid: String) async throws -> Thread {
        let response = try await client.thread(query: .init(
            apikey: apikey,
            uid: uid
        ))
        return try response.ok.body.json
    }
}
