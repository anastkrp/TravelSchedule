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
    
    init(client: Client) {
        self.client = client
    }
    
    func thread(uid: String) async throws -> Thread {
        let response = try await client.thread(query: .init(
            uid: uid
        ))
        return try response.ok.body.json
    }
}
