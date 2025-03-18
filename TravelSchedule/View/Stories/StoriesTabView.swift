//
//  StoriesTabView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 17.03.2025.
//

import SwiftUI

struct StoriesTabView: View {
    @Binding var currentStoryIndex: Int
    let stories: [Story]
    
    var body: some View {
        TabView(selection: $currentStoryIndex) {
            ForEach(0..<stories.count, id: \.self) { story in
                StoryView(story: stories[story])
                    .onTapGesture(perform: didTapStory)
            }
        }
        .ignoresSafeArea()
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
    
    private func didTapStory() {
        let nextStoryIndex = currentStoryIndex + 1
        if nextStoryIndex < stories.count {
            currentStoryIndex = nextStoryIndex
        } else {
            currentStoryIndex = 0
        }
    }
}
