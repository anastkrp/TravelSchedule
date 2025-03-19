//
//  TravelScheduleApp.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 08.02.2025.
//

import SwiftUI

@main
struct TravelScheduleApp: App {
    @AppStorage("isDarkMode") private var isDarkModeEnabled: Bool = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .colorScheme(isDarkModeEnabled ? .dark : .light)
        }
    }
}
