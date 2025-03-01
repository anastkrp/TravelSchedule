//
//  MainView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 21.02.2025.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var viewModel: DirectionViewModel
    @EnvironmentObject private var router: Router
    
    var body: some View {
        VStackErrorHandling(errorType: .none) {
            DestinationView(
                from: viewModel.from,
                to: viewModel.to,
                didTapFrom: {
                    viewModel.direction = .from
                    router.push(.citySelection)
                },
                didTapTo: {
                    viewModel.direction = .to
                    router.push(.citySelection)
                },
                didTapSwapButton: { viewModel.swapDestination() }
            )
            .padding()
            Button("search") {
                router.push(.carriers(viewModel.from))
            }
        }
    }
}

#Preview {
    MainView()
}
