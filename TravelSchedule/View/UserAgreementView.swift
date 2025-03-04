//
//  UserAgreementView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 04.03.2025.
//

import SwiftUI

struct UserAgreementView: View {
    @State private var isLoading = true
    
    var body: some View {
        ZStack {
            WebView(isLoading: $isLoading, url: URL(string: "https://yandex.ru/legal/practicum_offer")!)
                .ignoresSafeArea(edges: .bottom)
                .modifier(NavigationBarStyle(title: "Пользовательское соглашение"))
            
            if isLoading {
                ProgressView("Загрузка...")
                    .progressViewStyle(.circular)
                    .tint(.blackTS)
            }
        }
        .background(.whiteTS)
    }
}

#Preview {
    UserAgreementView()
}
