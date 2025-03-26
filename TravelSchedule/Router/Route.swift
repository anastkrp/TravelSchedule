//
//  Route.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 28.02.2025.
//

import Foundation

enum Route: Hashable {
    case citySelection
    case stationSelection
    case carriers(title: String, from: String, to: String)
    case filter
    case carrierInfo(Int)
    case userAgreement
}
