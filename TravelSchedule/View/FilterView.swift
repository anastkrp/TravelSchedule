//
//  FilterView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 02.03.2025.
//

import SwiftUI

struct FilterView: View {
    @EnvironmentObject private var viewModel: ViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Время отправления")
                .font(.system(size: 24, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            Group {
                Toggle(isOn: $viewModel.filter.morning) {
                    Text("Утро 06:00 - 12:00")
                }
                Toggle(isOn: $viewModel.filter.afternoon) {
                    Text("День 12:00 - 18:00")
                }
                Toggle(isOn: $viewModel.filter.evening) {
                    Text("Вечер 18:00 - 00:00")
                }
                Toggle(isOn: $viewModel.filter.night) {
                    Text("Ночь 00:00 - 06:00")
                }
            }
            .toggleStyle(CheckboxSquare())
            
            Text("Показывать варианты с пересадками")
                .font(.system(size: 24, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            Group {
                Toggle(isOn: $viewModel.filter.transferYes) {
                    Text("Да")
                }
                Toggle(isOn: $viewModel.filter.transferNo) {
                    Text("Нет")
                }
            }
            .toggleStyle(CheckboxCircle())
            
            Spacer()
        }
        .modifier(NavigationBarStyle(title: ""))
    }
}
