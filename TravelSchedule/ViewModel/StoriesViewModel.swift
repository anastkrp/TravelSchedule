//
//  StoriesViewModel.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 17.03.2025.
//

import Foundation

final class StoriesViewModel: ObservableObject {
    @Published var storyCollection: [StoryCollection] = []
    
    init() {
        loadStories()
    }
    
    func loadStories() {
        if storyCollection.isEmpty {
            storyCollection = MockData.storiesMock
        }
    }
    
    func getCurrentStory(_ id: UUID) -> [Story] {
        return storyCollection.first(where: { $0.id == id })?.stories ?? []
    }
}
