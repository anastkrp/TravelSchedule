//
//  StationsView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 25.02.2025.
//

import SwiftUI

struct StationsView: View {
    @EnvironmentObject private var cityStationViewModel: CityStationViewModel
    @EnvironmentObject private var router: Router
    @State private var searchText = String()
    private var searchResults: [Stations] {
        searchText.isEmpty
        ? cityStationViewModel.stations
        : cityStationViewModel.stations.filter { $0.stationName.contains(searchText) }
    }
    
    var body: some View {
        VStack {
            SearchBar(searchText: $searchText)
            ListCityStation(
                isEmptyData: searchResults.isEmpty,
                emptyTitle: "Станция не найдена",
                isLoading: cityStationViewModel.stations.isEmpty
            ) {
                ForEach(searchResults, id: \.self) { station in
                    CityStationRow(titleRow: station.stationName)
                        .onTapGesture(perform: {
                            cityStationViewModel.stationSelected = (name: station.stationName, code: station.code)
                            router.popToRoot()
                        })
                }
            }
            .modifier(NavigationBarStyle(title: "Выбор станции"))
        }
        .background(.whiteTS)
    }
}

#Preview {
    StationsView()
}
