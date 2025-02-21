//
//  ContentView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 08.02.2025.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
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
    }
}

#Preview {
    ContentView()
}
