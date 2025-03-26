//
//  SettingsView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 21.02.2025.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var settingsViewModel = SettingsViewModel()
    @EnvironmentObject private var router: Router
    
    var body: some View {
        VStack(spacing: 0.0) {
            Toggle("Темная тема", isOn: $settingsViewModel.isDarkModeEnabled)
                .padding()
                .foregroundColor(.blackTS)
                .tint(.blueUniversal)
            
            HStack {
                Text("Пользовательское соглашение")
                Spacer()
                Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: Constants.iconWidth, height: Constants.iconHeight)
                    .tint(.blackTS)
            }
            .padding()
            .contentShape(Rectangle())
            .onTapGesture {
                router.push(.userAgreement)
            }
            
            Spacer()
            
            Text("Приложение использует API «Яндекс.Расписания»")
                .font(.footnote)
                .foregroundColor(.blackTS)
                .multilineTextAlignment(.center)
                
            Text("Версия 1.0 (beta)")
                .font(.footnote)
                .foregroundColor(.blackTS)
                .multilineTextAlignment(.center)
                .padding(.top)
                .padding(.bottom, 24)
                
        }
        .background(.whiteTS)
    }
}

#Preview {
    SettingsView()
}
