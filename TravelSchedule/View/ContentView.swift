//
//  ContentView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 08.02.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var mainViewModel = MainViewModel()
    @StateObject private var cityStationViewModel = CityStationViewModel()
    @StateObject private var carriersViewModel = CarriersViewModel()
    @StateObject private var storiesViewModel = StoriesViewModel()
    @StateObject private var router = Router()

    var body: some View {
        NavigationStack(path: $router.path) {
            TabView {
                MainView()
                    .tabItem {
                        Image("Schedule")
                    }
                
                SettingsView()
                    .tabItem {
                        Image("Settings")
                    }
            }
            .tint(.blackTS)
            .navigationDestination(for: Route.self) { destination in
                switch destination {
                case .citySelection:
                    CitiesView()
                case .stationSelection:
                    StationsView()
                case .carriers(let title, let from, let to):
                    CarriersView(destinationTitle: title, codeFrom: from, codeTo: to)
                case .filter:
                    FilterView()
                case .carrierInfo(let code):
                    CarrierInfoView(carrierCode: code)
                case .userAgreement:
                    UserAgreementView()
                }
            }
            .fullScreenCover(isPresented: $storiesViewModel.isPresented) {
                StoriesView()
                    .colorScheme(.dark)
            }
        }
        .environmentObject(mainViewModel)
        .environmentObject(cityStationViewModel)
        .environmentObject(carriersViewModel)
        .environmentObject(storiesViewModel)
        .environmentObject(router)
    }
}

#Preview {
    ContentView()
}
