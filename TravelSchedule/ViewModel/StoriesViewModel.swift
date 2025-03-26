//
//  StoriesViewModel.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 17.03.2025.
//

import SwiftUI

@MainActor
final class StoriesViewModel: ObservableObject {
    @Published var storyCollection: [StoryCollection] = []
    @Published var progress: CGFloat = 0
    @Published var currentStoryIndex: Int = 0
    @Published var isPresented: Bool = false
    @Published var storyId: UUID?
    var numberOfSections = 0
    
    init() {
        loadStories()
    }
    
    func loadStories() {
        if storyCollection.isEmpty {
            storyCollection = MockData.storiesMock
        }
    }
    
    func getCurrentStory() -> [Story] {
        let currentStory = storyCollection.first(where: { $0.id == storyId })?.stories ?? []
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
    
    func isSeen() {
        if let index = storyCollection.firstIndex(where: { $0.id == storyId }) {
            withAnimation(.easeInOut.delay(0.6)) {
                storyCollection[index].isSeen = true
            }
        }
    }
    
    func reset() {
        progress = 0
        currentStoryIndex = 0
        numberOfSections = 0
        storyId = nil
    }
    
    func isCompletedViewStory() {
        if progress == 1.0 {
            isSeen()
            isPresented = false
        }
    }
}
