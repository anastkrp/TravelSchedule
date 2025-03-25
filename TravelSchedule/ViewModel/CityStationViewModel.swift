//
//  CityStationViewModel.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 25.03.2025.
//

import SwiftUI

@MainActor
final class CityStationViewModel: ObservableObject {
    @Published var cityWithStations: [StationsByCity] = []
    @Published var stations: [Stations] = []
    @Published var citySelected: String = ""
    @Published var stationSelected = (name: "", code: "")
    @Published var isServerError: Bool = false
    
    private let service = StationsListService()
    
    func loadStationList() async {
        if !cityWithStations.isEmpty { return }
        isServerError = false
        do {
            async let stationList = service.stationsList()
            try await filterStationsByCity(stationList)
        } catch {
            isServerError = true
        }
    }
    
    private func filterStationsByCity(_ stationsList: StationsList) {
        guard let country = stationsList.countries?.first(
            where: { $0.codes?.yandex_code == "l225" }
        ) else {
            return
        }
        
        var filteredStations: [StationsByCity] = []
        let regions = country.regions ?? []
        
        for region in regions {
            for settlement in region.settlements ?? [] {
                guard
                    let cityName = settlement.title,
                    !cityName.isEmpty
                else {
                    continue
                }
                let stations = (settlement.stations ?? [])
                    .filter { $0.transport_type == "train" }
                    .compactMap { station in
                        guard
                            let stationName = station.title,
                            let stationCode = station.codes?.yandex_code
                        else {
                            return nil
                        }
                        return Stations(
                            stationName: removeCityName(stationName),
                            code: stationCode
                        )
                    } as [Stations]
                
                if !stations.isEmpty {
                    filteredStations.append(
                        StationsByCity(
                            cityName: cityName,
                            stations: stations
                        )
                    )
                }
            }
        }
        withAnimation(.easeInOut) {
            cityWithStations = filteredStations.sorted{$0.cityName < $1.cityName}
        }
    }
    
    private func removeCityName(_ stationName: String) -> String {
        if stationName.contains("вокзал") {
            guard
                let startIndex = stationName.firstIndex(of: "("),
                let endIndex = stationName.firstIndex(of: ")")
            else {
                return stationName
            }
            let firstIndex = stationName.index(after: startIndex)
            return String(stationName[firstIndex..<endIndex])
        } else {
            return stationName
        }
    }
}
