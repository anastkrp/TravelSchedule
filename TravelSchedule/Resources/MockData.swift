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
    
    static let carriersMock: [Carrier] = [
        Carrier(
            code: 1,
            carrierTitle: "РЖД",
            carrierLogo: "RZD",
            departureDay: "14 января",
            departureTime: "22:30",
            arrivalTime: "08:15",
            duration: 72000,
            transfer: "С пересадкой в Костроме"
        ),
        Carrier(
            code: 2,
            carrierTitle: "ФГК",
            carrierLogo: "FGC",
            departureDay: "15 января",
            departureTime: "01:15",
            arrivalTime: "09:00",
            duration: 32400,
            transfer: ""
        )
    ]
    
    static let carriersInfoMock: [CarrierInfo] = [
        CarrierInfo(
            code: 1,
            title: "ОАО «РЖД»",
            logo: "RZD",
            phone: "+7 (904) 329-27-71",
            email: "rzd@yandex.ru"
        ),
        CarrierInfo(
            code: 2,
            title: "АО «ФГК»",
            logo: "FGC",
            phone: "+7 (904) 329-27-71",
            email: "fgc@yandex.ru"
        )
    ]
    
    static var storiesMock: [StoryCollection] = [
        StoryCollection(
            storyPreviewImage: "storySmall_1",
            stories: [
                Story(title: "Text",
                      description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                      imageFull: "storyFull_1"
                     ),
                Story(title: "Text",
                      description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                      imageFull: "storyFull_1.2"
                     )
                ],
            isSeen: false),
        StoryCollection(
            storyPreviewImage: "storySmall_2",
            stories: [
                Story(title: "Text Text",
                      description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                      imageFull: "storyFull_2"
                     ),
                Story(title: "Text Text",
                      description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                      imageFull: "storyFull_2.2"
                     )
                ],
            isSeen: false),
        StoryCollection(
            storyPreviewImage: "storySmall_3",
            stories: [
                Story(title: "Text Text",
                      description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                      imageFull: "storyFull_3"
                     ),
                Story(title: "Text Text",
                      description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                      imageFull: "storyFull_3.2"
                     )
                ],
            isSeen: false),
        StoryCollection(
            storyPreviewImage: "storySmall_4",
            stories: [
                Story(title: "Text Text",
                      description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                      imageFull: "storyFull_4"
                     ),
                Story(title: "Text Text",
                      description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                      imageFull: "storyFull_4.2"
                     )
                ],
            isSeen: false),
        StoryCollection(
            storyPreviewImage: "storySmall_5",
            stories: [
                Story(title: "Text Text",
                      description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                      imageFull: "storyFull_5"
                     ),
                Story(title: "Text Text",
                      description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text",
                      imageFull: "storyFull_5.2"
                     )
                ],
            isSeen: false)
    ]
}
