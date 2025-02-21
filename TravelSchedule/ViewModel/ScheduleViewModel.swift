//
//  ScheduleViewModel.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 21.02.2025.
//

import Foundation

final class ScheduleViewModel: ObservableObject {
    @Published var from: String = ""
    @Published var to: String = ""
    
    func swapDestination() {
        if !from.isEmpty && !to.isEmpty {
            swap(&from, &to)
        }
    }
}
