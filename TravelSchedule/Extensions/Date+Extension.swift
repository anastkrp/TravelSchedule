//
//  Date+Extension.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 25.03.2025.
//

import Foundation

extension Date {
    func toStringFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
}
