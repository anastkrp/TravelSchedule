//
//  StoriesView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 16.03.2025.
//

import SwiftUI

struct StoriesView: View {
    @EnvironmentObject var router: Router
    @EnvironmentObject private var storiesViewModel: StoriesViewModel
    let idStory: UUID
    private var timerConfiguration: TimerConfiguration { .init(storiesCount: storiesViewModel.numberOfSections) }

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.blackUniversal
                .ignoresSafeArea()
            
            StoriesTabView(
                currentStoryIndex: $storiesViewModel.currentStoryIndex,
                stories: storiesViewModel.getCurrentStory(idStory)
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
                isCompletedViewStory($0)
            }
            
            CloseButton()
                .padding(.top, Constants.paddingTop)
                .padding(.trailing, Constants.paddingTrailing)
        }
        .navigationBarBackButtonHidden(true)
        .onDisappear {
            storiesViewModel.reset()
        }
    }
    
    private func isCompletedViewStory(_ progress: CGFloat){
        if progress == 1.0 {
            storiesViewModel.isSeen(id: idStory)
            router.pop()
        }
    }
}
