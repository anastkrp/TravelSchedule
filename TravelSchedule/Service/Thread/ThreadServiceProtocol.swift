//
//  ThreadServiceProtocol.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 11.02.2025.
//

import Foundation

typealias Thread = Components.Schemas.ThreadStation

protocol ThreadServiceProtocol {
    func thread(uid: String) async throws -> Thread
}
