//
//  CloseButton.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 17.03.2025.
//

import SwiftUI

struct CloseButton: View {
    @EnvironmentObject var viewModel: StoriesViewModel
    
    var body: some View {
        Button {
            viewModel.isPresented = false
        } label: {
            Image("ButtonClose")
        }
    }
}

#Preview {
    CloseButton()
}
