//
//  StoriesTabView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 17.03.2025.
//

import SwiftUI

struct StoriesTabView: View {
    let stories: [Story]
    
    var body: some View {
        TabView() {
            ForEach(stories) { story in
                StoryView(story: story)
            }
        }
        .ignoresSafeArea()
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}
