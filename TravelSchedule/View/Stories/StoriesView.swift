//
//  StoriesView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 16.03.2025.
//

import SwiftUI

struct StoriesView: View {
    @EnvironmentObject private var storiesViewModel: StoriesViewModel
    @State private var dragValue: Double = 0.0
    
    private var timerConfiguration: TimerConfiguration {
        .init(storiesCount: storiesViewModel.numberOfSections)
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.blackUniversal
                .ignoresSafeArea()
            Group {
                StoriesTabView(
                    currentStoryIndex: $storiesViewModel.currentStoryIndex,
                    stories: storiesViewModel.getCurrentStory()
                )
                .onChange(of: storiesViewModel.currentStoryIndex) {
                    storiesViewModel.didChangeStoryIndex($0)
                }
                
                StoriesProgressView(
                    storiesCount: storiesViewModel.numberOfSections,
                    timerConfiguration: timerConfiguration,
                    progress: $storiesViewModel.progress
                )
                .onChange(of: storiesViewModel.progress) {
                    storiesViewModel.didChangeProgress($0)
                    storiesViewModel.isCompletedViewStory()
                }
                
                CloseButton()
                    .padding(.top, Constants.paddingTop)
                    .padding(.trailing, Constants.paddingTrailing)
            }
            .opacity(1 - (dragValue / Constants.opacityIndicator))
        }
        .gesture(swipeClose)
        .navigationBarBackButtonHidden(true)
        .onDisappear {
            storiesViewModel.reset()
        }
    }
    
    private var swipeClose: some Gesture {
        DragGesture()
            .onChanged { value in
                if value.translation.height > 0.0 {
                    withAnimation {
                        dragValue = value.translation.height
                    }
                }
            }
            .onEnded { value in
                if value.translation.height > Constants.dragIndicatorSize {
                    storiesViewModel.isPresented = false
                } else {
                    withAnimation {
                        dragValue = 0
                    }
                }
            }
    }
}
