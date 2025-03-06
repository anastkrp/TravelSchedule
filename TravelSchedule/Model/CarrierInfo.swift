//
//  CarrierInfo.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 04.03.2025.
//

import Foundation

struct CarrierInfo: Identifiable, Hashable {
    let id = UUID()
    let code: Int
    let title: String
    let logo: String
    let phone: String
    let email: String
}
