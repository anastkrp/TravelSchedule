//
//  StoryView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 16.03.2025.
//

import SwiftUI

struct StoryView: View {
    let story: Story
    
    var body: some View {
        Image(story.imageFull)
            .resizable()
            .cornerRadius(Constants.storyImageCornerRadius)
            .overlay(
                VStack() {
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
            )
            .padding(.top, 7)
            .padding(.bottom, 17)
    }
}
