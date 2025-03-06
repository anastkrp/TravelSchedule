//
//  ListCarrier.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 01.03.2025.
//

import SwiftUI

public struct ListCarrier<Content: View>: View {
    let isEmptyData: Bool
    let emptyTitle: String
    @ViewBuilder var content: Content
    
    public var body: some View {
        if isEmptyData {
            VStack {
                Text(emptyTitle)
                    .font(.system(size: 24, weight: .bold))
            }
            .frame(maxHeight: .infinity)
        } else {
            ScrollView {
                LazyVStack(spacing: 0) {
                    content
                        .padding(.vertical, 4)
                }
            }
        }
    }
}
