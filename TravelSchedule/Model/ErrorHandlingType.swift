//
//  ErrorHandlingType.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 01.03.2025.
//

import Foundation

enum ErrorHandlingType {
    case serverError
    case noInternetConnection
    
    var title: String {
        switch self {
        case .serverError:
            return "Ошибка сервера"
        case .noInternetConnection:
            return "Нет интернета"
        }
    }
    
    var image: String {
        switch self {
        case .serverError:
            return "ServerError"
        case .noInternetConnection:
            return "NoInternet"
        }
    }
}
