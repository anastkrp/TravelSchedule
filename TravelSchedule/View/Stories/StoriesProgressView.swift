//
//  StoriesProgressView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 17.03.2025.
//

import SwiftUI
import Combine

struct StoriesProgressView: View {
    let storiesCount: Int
    let timerConfiguration: TimerConfiguration
    
    @Binding var progress: CGFloat
    @State private var timer: Timer.TimerPublisher
    @State private var cancellable: Cancellable?
    
    init(storiesCount: Int, timerConfiguration: TimerConfiguration, progress: Binding<CGFloat>) {
        self.storiesCount = storiesCount
        self.timerConfiguration = timerConfiguration
        self.timer = Self.createTimer(configuration: timerConfiguration)
        self._progress = progress
    }
    
    var body: some View {
        ProgressBar(numberOfSections: storiesCount, progress: progress)
            .padding(.top, 35)
            .padding(.horizontal, 12)
            .onAppear {
                timer = Self.createTimer(configuration: timerConfiguration)
                cancellable = timer.connect()
            }
            .onDisappear {
                cancellable?.cancel()
            }
            .onReceive(timer) { _ in
                timerTick()
            }
    }
    
    private func timerTick() {
        var nextProgress = progress + timerConfiguration.progressPerTick
        if nextProgress >= 1 {
            nextProgress = 0
        }
        withAnimation {
            progress = nextProgress
        }
    }
    
    private static func createTimer(configuration: TimerConfiguration) -> Timer.TimerPublisher {
        Timer.publish(every: configuration.timerTickInternal, on: .main, in: .common)
    }
}
