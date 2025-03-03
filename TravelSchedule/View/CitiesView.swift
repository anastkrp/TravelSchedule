//
//  CitiesView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 25.02.2025.
//

import SwiftUI

struct CitiesView: View {
    @EnvironmentObject private var viewModel: ViewModel
    @EnvironmentObject private var router: Router
    @State private var searchText = String()
    private var searchResults: [CityStations] {
        searchText.isEmpty
        ? viewModel.cityStations
        : viewModel.cityStations.filter { $0.city.contains(searchText) }
    }
    
    var body: some View {
        VStack() {
            SearchBar(searchText: $searchText)
            ListCityStation(
                isEmptyData: searchResults.isEmpty,
                emptyTitle: "Город не найден"
            ) {
                ForEach(searchResults) { cities in
                    CityStationRow(titleRow: cities.city)
                        .onTapGesture {
                            viewModel.citySelected = cities.city
                            router.push(.stationSelection(cities.stations))
                        }
                }
            }
            .modifier(NavigationBarStyle(title: "Выбор города"))
        }
        .onAppear {
            viewModel.loadCityStations()
        }
    }
}
