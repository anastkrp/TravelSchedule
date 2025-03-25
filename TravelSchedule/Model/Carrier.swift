//
//  Carrier.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 01.03.2025.
//

import Foundation

struct Carrier: Identifiable, Hashable {
    let id = UUID()
    let code: Int
    let carrierTitle: String
    let carrierLogo: String
    let departureDay: String
    let departureTime: String
    let arrivalTime: String
    let duration: Int
    let transfer: Bool
}
