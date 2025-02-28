//
//  ScheduleView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 21.02.2025.
//

import SwiftUI

struct ScheduleView: View {
    @ObservedObject var viewModel = ScheduleViewModel()
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack {
            DestinationView(
                from: viewModel.from,
                to: viewModel.to,
                didTapFrom: { router.push(.citySelection) },
                didTapTo: { router.push(.citySelection) },
                didTapSwapButton: { viewModel.swapDestination() }
            )
            .padding()
        }
    }
}

#Preview {
    ScheduleView()
}
