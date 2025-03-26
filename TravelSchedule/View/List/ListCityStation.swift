//
//  ListCityStation.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 28.02.2025.
//

import SwiftUI

public struct ListCityStation<Content: View>: View {
    
    // MARK: - Properties
    
    let isEmptyData: Bool
    let emptyTitle: String
    let isLoading: Bool
    @ViewBuilder var content: Content
    
    // MARK: - Content
    
    public var body: some View {
        if isEmptyData {
            if isLoading {
                loadingView()
            } else {
                emptyDataView(emptyTitle)
            }
        } else {
            ScrollView {
                LazyVStack(spacing: 0) {
                    content
                }
            }
        }
    }
    
    // MARK: - View
    
    private func loadingView() -> some View {
        VStack {
            ProgressView("Загрузка...")
                .progressViewStyle(.circular)
                .tint(.blackTS)
                .opacity(isLoading ? 1 : 0)
        }
        .frame(maxHeight: .infinity)
    }
    
    private func emptyDataView(_ emptyTitle: String) -> some View {
        VStack {
            Text(emptyTitle)
                .font(.system(size: 24, weight: .bold))
        }
        .frame(maxHeight: .infinity)
    }
}
