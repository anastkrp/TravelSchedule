//
//  MockData.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 26.02.2025.
//

import Foundation

struct MockData {
    static let cityStationsMock: [CityStations] = [
        CityStations(
            city: "Москва",
            stations: ["Белорусский вокзал", "Восточный вокзал", "Казанский вокзал", "Ленинградский вокзал"]
        ),
        CityStations(
            city: "Санкт-Петербург",
            stations: ["Балтийский вокзал", "Ладожский вокзал", "Московский вокзал"]
        ),
        CityStations(
            city: "Сочи",
            stations: ["Аэропорт Сочи", "Станция Сочи", "Хоста"]
        )
    ]
}
