//
//  StationsView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 25.02.2025.
//

import SwiftUI

struct StationsView: View {
    @EnvironmentObject private var viewModel: ViewModel
    @EnvironmentObject private var router: Router
    @State private var searchText = String()
    private var searchResults: [String] {
        searchText.isEmpty
        ? stations
        : stations.filter { $0.contains(searchText) }
    }
    let stations: [String]
    
    var body: some View {
        VStack {
            SearchBar(searchText: $searchText)
            ListCityStation(
                isEmptyData: searchResults.isEmpty,
                emptyTitle: "Станция не найдена"
            ) {
                ForEach(searchResults, id: \.self) { station in
                    CityStationRow(titleRow: station)
                        .onTapGesture(perform: {
                            viewModel.stationSelected = station
                            viewModel.addDestination()
                            router.popToRoot()
                        })
                }
            }
            .modifier(NavigationBarStyle(title: "Выбор станции"))
        }
    }
}

#Preview {
    StationsView(stations: [""])
}
