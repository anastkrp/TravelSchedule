//
//  CitiesView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 25.02.2025.
//

import SwiftUI

struct CitiesView: View {
    @ObservedObject var viewModel = CityStationsViewModel()
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack() {
            Button("back", action: {
                router.pop()
            })
            Button("stations", action: {
                router.push(.stationSelection(["cities.stations"]))
            })
        }
    }
}
