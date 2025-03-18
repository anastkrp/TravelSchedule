//
//  StoriesViewModel.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 17.03.2025.
//

import SwiftUI

final class StoriesViewModel: ObservableObject {
    @Published var storyCollection: [StoryCollection] = []
    @Published var progress: CGFloat = 0
    @Published var currentStoryIndex: Int = 0
    var numberOfSections = 0
    
    init() {
        loadStories()
    }
    
    func loadStories() {
        if storyCollection.isEmpty {
            storyCollection = MockData.storiesMock
        }
    }
    
    func getCurrentStory(_ id: UUID) -> [Story] {
        let currentStory = storyCollection.first(where: { $0.id == id })?.stories ?? []
        numberOfSections = currentStory.count
        return currentStory
    }
    
    func didChangeStoryIndex(_ newValue: Int) {
        let timeInterval = CGFloat(newValue) / CGFloat(numberOfSections)
        if newValue < numberOfSections {
            withAnimation {
                progress = timeInterval
            }
        }
    }
    
    func didChangeProgress(_ newValue: CGFloat) {
        withAnimation {
            currentStoryIndex = Int(newValue * CGFloat(numberOfSections))
        }
    }
    
    func isSeen(id: UUID) {
        withAnimation(.easeInOut.delay(0.6)) {
            if let index = storyCollection.firstIndex(where: { $0.id == id }) {
                storyCollection[index].isSeen = true
            }
        }
    }
    
    func reset() {
        progress = 0
        currentStoryIndex = 0
        numberOfSections = 0
    }
}
