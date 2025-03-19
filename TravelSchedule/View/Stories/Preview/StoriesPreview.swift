//
//  StoriesPreview.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 16.03.2025.
//

import SwiftUI

struct StoriesPreview: View {
    
    // MARK: - Properties
    
    let storyCollection: [StoryCollection]
    let didTapStory: (UUID) -> Void
    
    // MARK: - Content
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(storyCollection) { story in
                    storyImage(story.storyPreviewImage, isSeen: story.isSeen)
                        .overlay(storyTitle(story.stories.isEmpty ? "" : story.stories[0].title))
                        .onTapGesture {
                            didTapStory(story.id)
                        }
                        .opacity(story.isSeen ? 0.5 : 1.0)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, Constants.paddingLarge)
        }
    }
    
    // MARK: - View
    
    private func storyImage(_ image: String, isSeen: Bool) -> some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .frame(width: Constants.storySmallWidth, height: Constants.storySmallHeight)
            .cornerRadius(Constants.cornerRadiusMedium)
            .overlay {
                RoundedRectangle(cornerRadius: Constants.cornerRadiusMedium)
                    .strokeBorder(Color.blueUniversal, lineWidth: 4)
                    .opacity(isSeen ? 0 : 1)
            }
    }
    
    private func storyTitle(_ title: String) -> some View {
        VStack(spacing: .zero) {
            Spacer()
            Text(title)
                .font(.caption)
                .lineLimit(Constants.lineLimitMedium)
                .foregroundStyle(.whiteUniversal)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, Constants.paddingSmall)
                .padding(.bottom, 12)
        }
    }
}
