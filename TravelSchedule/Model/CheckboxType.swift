//
//  CheckboxType.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 07.03.2025.
//

import Foundation

enum CheckboxType {
    case square
    case circle
    
    func checkboxImage(_ isOn: Bool) -> String {
        switch self {
        case .square:
            return isOn ? "checkmark.square.fill" : "square"
        case .circle:
            return isOn ? "checkmark.circle.fill" : "circle"
        }
    }
}
