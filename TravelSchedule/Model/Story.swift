//
//  Story.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 16.03.2025.
//

import Foundation

struct Story: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let imageFull: String
}

struct Stories: Identifiable {
    let id = UUID()
    let storyPreviewImage: String
    let stories: [Story]
    var isSeen: Bool
}
