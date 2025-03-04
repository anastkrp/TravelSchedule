//
//  SettingsView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 21.02.2025.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkModeEnabled: Bool = false
    
    var body: some View {
        VStack(spacing: 0.0) {
            Toggle("Темная тема", isOn: $isDarkModeEnabled)
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
            
            Spacer()
            
            Text("Приложение использует API «Яндекс.Расписания»")
                .font(.footnote)
                .foregroundColor(Color("BlackTS"))
                .multilineTextAlignment(.center)
                
            Text("Версия 1.0 (beta)")
                .font(.footnote)
                .foregroundColor(Color("BlackTS"))
                .multilineTextAlignment(.center)
                .padding(.top)
                .padding(.bottom, 24)
                
        }
    }
}

#Preview {
    SettingsView()
}
