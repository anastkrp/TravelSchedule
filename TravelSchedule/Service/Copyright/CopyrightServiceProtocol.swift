//
//  CopyrightServiceProtocol.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 09.02.2025.
//

import Foundation

typealias Copyright = Components.Schemas.Copyright

protocol CopyrightServiceProtocol {
    func getCopyright() async throws -> Copyright
}
