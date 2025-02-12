//
//  CarrierService.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 08.02.2025.
//

import OpenAPIRuntime
import OpenAPIURLSession

final class CarrierService: CarrierServiceProtocol {
    private let client: Client
    
    init(client: Client) {
        self.client = client
    }
    
    func getCarrier(code: String, system: String) async throws -> Carriers {
        let response = try await client.getCarrier(query: .init(
            code: code,
            system: system
        ))
        return try response.ok.body.json
    }
}
