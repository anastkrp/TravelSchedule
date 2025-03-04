//
//  MainView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 21.02.2025.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var viewModel: ViewModel
    @EnvironmentObject private var router: Router
    @StateObject private var monitor = NetworkMonitor()
    
    var body: some View {
        VStackErrorHandling(errorType: monitor.isConnected ? .none : .noInternetConnection) {
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
            
            if viewModel.onSearch {
                Button(action: {
                    router.push(.carriers)
                }) {
                    Text("Найти")
                        .fontWeight(.bold)
                        .foregroundStyle(.whiteUniversal)
                        .frame(width: Constants.buttonWidth, height: Constants.buttonHeight)
                        .background() {
                            RoundedRectangle(cornerRadius: Constants.cornerRadiusMedium)
                                .fill(.blueUniversal)
                        }
                }
            }
        }
    }
}

#Preview {
    MainView()
}
