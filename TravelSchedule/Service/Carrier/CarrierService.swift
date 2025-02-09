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
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getCarrier(code: String, system: String) async throws -> Carriers {
        let response = try await client.getCarrier(query: .init(
            apikey: apikey,
            code: code,
            system: system
        ))
        return try response.ok.body.json
    }
}
