//
//  SearchService.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 10.02.2025.
//

import OpenAPIRuntime
import OpenAPIURLSession

struct SearchService: SearchServiceProtocol {
    private let networkClient = NetworkClient()
    
    func search(from: String, to: String, date: String) async throws -> Search {
        try await networkClient.fetchSchedule(from: from, to: to, date: date)
    }
}
