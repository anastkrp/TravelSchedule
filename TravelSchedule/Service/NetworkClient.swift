//
//  NetworkClient.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 25.03.2025.
//

import Foundation
import OpenAPIURLSession

actor NetworkClient {
    private let client: Client
    private let key = Constants.apiKey
    
    init() {
        self.client = Client(
            serverURL: try! Servers.Server1.url(),
            transport: URLSessionTransport(),
            middlewares: [AuthenticationMiddleware(authorizationHeaderFieldValue: key)]
        )
    }
    
    func fetchStationList() async throws -> StationsList {
        let response = try await client.stationsList(query: .init())
        let httpBody = try response.ok.body.html
        let buffer = try await Data(collecting: httpBody, upTo: Constants.bufferSize)
        return try JSONDecoder().decode(StationsList.self, from: buffer)
    }
    
    func fetchSchedule(from: String, to: String, date: String) async throws -> Search {
        let response = try await client.search(query: .init(
            from: from,
            to: to,
            date: date
        ))
        return try response.ok.body.json
    }
}
