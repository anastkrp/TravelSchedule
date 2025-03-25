//
//  String+Extension.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 25.03.2025.
//

import Foundation

extension String {
    func toDayFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = dateFormatter.date(from: self) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "d MMMM"
            outputFormatter.locale = Locale(identifier: "ru_RU")
            return outputFormatter.string(from: date)
        }
        return ""
    }
    
    func toTimeFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let date = dateFormatter.date(from: self) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "HH:mm"
            outputFormatter.locale = Locale(identifier: "ru_RU")
            return outputFormatter.string(from: date)
        }
        return ""
    }
}
