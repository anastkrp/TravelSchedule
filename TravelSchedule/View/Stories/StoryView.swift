//
//  StoryView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 16.03.2025.
//

import SwiftUI

struct StoryView: View {
    
    // MARK: - Properties
    
    let story: Story
    
    // MARK: - Content
    
    var body: some View {
        content
    }
    
    // MARK: - View
    
    private var content: some View {
        Image(story.imageFull)
            .resizable()
            .cornerRadius(Constants.storyImageCornerRadius)
            .overlay(textOverlay)
            .padding(.top, 7)
            .padding(.bottom, 17)
    }
    
    private var textOverlay: some View {
        VStack {
            Spacer()
            Group {
                Text(story.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .lineLimit(Constants.lineLimitSmall)
                    .padding(.bottom)
                Text(story.description)
                    .font(.title3)
                    .lineLimit(Constants.lineLimitMedium)
            }
            .foregroundColor(.whiteUniversal)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal)
        .padding(.bottom, 40)
    }
}
