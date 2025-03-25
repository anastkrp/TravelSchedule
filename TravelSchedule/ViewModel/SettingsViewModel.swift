//
//  SettingsViewModel.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 25.03.2025.
//

import SwiftUI

@MainActor
final class SettingsViewModel: ObservableObject {
    @AppStorage("isDarkMode") var darkModeStorage: Bool = false
    @Published var isDarkModeEnabled: Bool = false {
        didSet {
            darkModeStorage = isDarkModeEnabled
        }
    }
    
    init() {
        isDarkModeEnabled = darkModeStorage
    }
}
