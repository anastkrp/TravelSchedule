//
//  MainView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 21.02.2025.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var mainViewModel: MainViewModel
    @EnvironmentObject private var cityStationViewModel: CityStationViewModel
    @EnvironmentObject private var storiesViewModel: StoriesViewModel
    @EnvironmentObject private var router: Router
    @StateObject private var monitor = NetworkMonitor()
    
    var body: some View {
        VStackErrorHandling(errorType: monitor.isConnected ? .none : .noInternetConnection) {
            StoriesPreview(
                storyCollection: storiesViewModel.storyCollection,
                didTapStory: { id in
                    storiesViewModel.storyId = id
                    storiesViewModel.isPresented = true
                }
            )
            
            DestinationView(
                from: mainViewModel.from,
                to: mainViewModel.to,
                didTapFrom: {
                    mainViewModel.direction = .from
                    router.push(.citySelection)
                },
                didTapTo: {
                    mainViewModel.direction = .to
                    router.push(.citySelection)
                },
                didTapSwapButton: { mainViewModel.swapDestination() }
            )
            .padding(.horizontal)
            .padding(.top, 20)
            
            Button(action: {
                router.push(.carriers(
                    mainViewModel.destinationTitle,
                    mainViewModel.codeFrom,
                    mainViewModel.codeTo
                ))
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
            .padding(.top)
            .opacity(mainViewModel.onSearch ? 1 : 0)
            Spacer()
        }
        .onAppear {
            mainViewModel.bind(cityStationVM: cityStationViewModel)
        }
    }
}

#Preview {
    MainView()
}
