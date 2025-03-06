//
//  InfoRowType.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 06.03.2025.
//

import Foundation

enum InfoRowType {
    case mail
    case phone
    
    var title: String {
        switch self {
        case .mail:
            return "E-mail"
        case .phone:
            return "Телефон"
        }
    }
    
    func linkType(link: String) -> URL? {
        switch self {
        case .mail:
            return URL(string: "mailto:\(link)")
        case .phone:
            return URL(string: "tel:\(link)")
        }
    }
}
