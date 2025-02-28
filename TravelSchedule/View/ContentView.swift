//
//  ContentView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 08.02.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var router = Router()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            TabView {
                ScheduleView()
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
                }
            }
        }
        .environmentObject(router)
    }
}

#Preview {
    ContentView()
}
