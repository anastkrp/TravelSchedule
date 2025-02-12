//
//  SearchServiceProtocol.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 10.02.2025.
//

import Foundation

typealias Search = Components.Schemas.Search

protocol SearchServiceProtocol {
    func search(from: String, to: String, date: String) async throws -> Search
}
