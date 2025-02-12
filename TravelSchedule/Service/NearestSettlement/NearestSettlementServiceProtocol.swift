//
//  NearestSettlementServiceProtocol.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 08.02.2025.
//

import Foundation

typealias NearestSettlement = Components.Schemas.Settlement

protocol NearestSettlementServiceProtocol {
    func getNearestSettlement(lat: Double, lng: Double, distance: Int) async throws -> NearestSettlement
}
