//
//  CarrierServiceProtocol.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 08.02.2025.
//

import Foundation

typealias Carriers = Components.Schemas.Carrier

protocol CarrierServiceProtocol {
    func getCarrier(code: String, system: String) async throws -> Carriers
}
