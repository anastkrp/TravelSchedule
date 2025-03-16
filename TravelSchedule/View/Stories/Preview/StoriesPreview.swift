//
//  StoriesPreview.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 16.03.2025.
//

import SwiftUI

struct StoriesPreview: View {
    let stories: [Stories]
    let didTapStory: () -> Void
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(stories) { story in
                    storyImage(story.storyPreviewImage, isSeen: story.isSeen)
                        .onTapGesture {
                            didTapStory()
                        }
                        .overlay {
                            VStack {
                                Spacer()
                                storyTitle(story.stories.isEmpty ? "" : story.stories[0].title)
                            }
                        }
                        .opacity(story.isSeen ? 0.5 : 1.0)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, Constants.paddingLarge)
        }
    }
    
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
        Text(title)
            .font(.caption)
            .lineLimit(Constants.lineLimitMedium)
            .foregroundStyle(.whiteUniversal)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, Constants.paddingSmall)
            .padding(.bottom, 12)
    }
}

#Preview {
    StoriesPreview(stories: MockData.storiesMock, didTapStory: {})
}
