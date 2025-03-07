//
//  Route.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 28.02.2025.
//

import Foundation

enum Route: Hashable {
    case citySelection
    case stationSelection([String])
    case carriers
    case filter
    case carrierInfo(Int)
    case userAgreement
}
