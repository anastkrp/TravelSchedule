//
//  Filter.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 02.03.2025.
//

import Foundation

struct Filter: Sendable {
    let morning: Bool
    let afternoon: Bool
    let evening: Bool
    let night: Bool
    let transferYes: Bool
    let transferNo: Bool
    
    var isActive: Bool {
        morning || afternoon || evening || night || transferYes || transferNo
    }
}

enum FilterType {
    case morning, afternoon, evening, night, transferYes, transferNo
}
