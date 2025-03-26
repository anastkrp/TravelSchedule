//
//  MainViewModel.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 25.03.2025.
//

import Combine

@MainActor
final class MainViewModel: ObservableObject {
    @Published var direction: Direction = .from
    @Published var from: String = ""
    @Published var to: String = ""
    @Published var onSearch: Bool = false
    var destinationTitle: String = ""
    var codeFrom: String = ""
    var codeTo: String = ""
    private var citySelected: String = ""
    private var cancellable: Set<AnyCancellable> = []
    
    func bind(cityStationVM: CityStationViewModel) {
        cityStationVM.$citySelected
            .sink { [weak self] city in
                guard let self else { return }
                if city.isEmpty { return }
                self.citySelected = city
            }
            .store(in: &cancellable)
        
        cityStationVM.$stationSelected
            .sink { [weak self] station in
                guard let self else { return }
                if station.code.isEmpty { return }
                self.addDestination(station: station.name, code: station.code)
            }
            .store(in: &cancellable)
    }
    
    func addDestination(station: String, code: String) {
        switch direction {
        case .from:
            from = "\(citySelected) (\(station))"
            codeFrom = code
        case .to:
            to = "\(citySelected) (\(station))"
            codeTo = code
        }
        
        if !from.isEmpty && !to.isEmpty {
            destinationTitle = from + " → " + to
            onSearch = true
        }
    }
    
    func swapDestination() {
        if !from.isEmpty && !to.isEmpty {
            swap(&from, &to)
            swap(&codeFrom, &codeTo)
            direction = direction == .from ? .to : .from
            destinationTitle = from + " → " + to
        }
    }
}
