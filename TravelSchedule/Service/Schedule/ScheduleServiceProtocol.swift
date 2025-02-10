//
//  ScheduleServiceProtocol.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 10.02.2025.
//

import Foundation

typealias Schedule = Components.Schemas.Schedule

protocol ScheduleServiceProtocol {
    func schedule(station: String, date: String) async throws -> Schedule
}
