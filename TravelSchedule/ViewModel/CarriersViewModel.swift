//
//  CarriersViewModel.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 01.03.2025.
//

import Foundation

final class CarriersViewModel: ObservableObject {
    @Published var carriers: [Carrier] = []
    var destinationTitle: String
    
    init(destinationTitle: String) {
        self.destinationTitle = destinationTitle
        carriers = MockData.carriersMock
    }
}
