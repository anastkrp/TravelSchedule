//
//  CitiesView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 25.02.2025.
//

import SwiftUI

struct CitiesView: View {
    @EnvironmentObject private var cityStationViewModel: CityStationViewModel
    @EnvironmentObject private var router: Router
    @State private var searchText = String()
    private var searchResults: [StationsByCity] {
        searchText.isEmpty
        ? cityStationViewModel.cityWithStations
        : cityStationViewModel.cityWithStations.filter { $0.cityName.contains(searchText) }
    }
    
    var body: some View {
        VStackErrorHandling(errorType: cityStationViewModel.isServerError ? .serverError : .none) {
            SearchBar(searchText: $searchText)
            ListCityStation(
                isEmptyData: searchResults.isEmpty,
                emptyTitle: "Город не найден",
                isLoading: cityStationViewModel.cityWithStations.isEmpty
            ) {
                ForEach(searchResults) { cities in
                    CityStationRow(titleRow: cities.cityName)
                        .onTapGesture {
                            cityStationViewModel.citySelected = cities.cityName
                            cityStationViewModel.stations = cities.stations
                            router.push(.stationSelection)
                        }
                }
            }
            .modifier(NavigationBarStyle(title: "Выбор города"))
        }
        .background(.whiteTS)
        .onAppear {
//            cityStationViewModel.loadStationList()
        }
    }
}
