//
//  StoriesView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 16.03.2025.
//

import SwiftUI

struct StoriesView: View {
    @EnvironmentObject private var storiesViewModel: StoriesViewModel
    let idStory: UUID
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.blackUniversal
                .ignoresSafeArea()
            StoriesTabView(stories: storiesViewModel.getCurrentStory(idStory))
            CloseButton()
                .padding(.top, 4)
                .padding(.trailing, 12)
        }
        .navigationBarBackButtonHidden(true)
    }
}
