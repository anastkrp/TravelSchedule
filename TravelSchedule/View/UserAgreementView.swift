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
            
            ProgressView("Загрузка...")
                .progressViewStyle(.circular)
                .tint(.blackTS)
                .opacity(isLoading ? 1 : 0)
        }
        .background(.whiteTS)
    }
}

#Preview {
    UserAgreementView()
}
