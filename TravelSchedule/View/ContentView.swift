//
//  ContentView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 08.02.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var router = Router()
    @StateObject private var viewModel = ViewModel()
    
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
            .tint(Color("BlackTS"))
            .navigationDestination(for: Route.self) { destination in
                switch destination {
                case .citySelection:
                    CitiesView()
                case .stationSelection(let stations):
                    StationsView(stations: stations)
                case .carriers:
                    CarriersView()
                case .filter:
                    FilterView()
                }
            }
        }
        .environmentObject(router)
        .environmentObject(viewModel)
    }
}

#Preview {
    ContentView()
}
