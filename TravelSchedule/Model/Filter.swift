//
//  Filter.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 02.03.2025.
//

import Foundation

struct Filter {
    var morning: Bool
    var afternoon: Bool
    var evening: Bool
    var night: Bool
    var transferYes: Bool
    var transferNo: Bool
    
    func isActive() -> Bool {
        return morning || afternoon || evening || night || transferYes || transferNo
    }
}
