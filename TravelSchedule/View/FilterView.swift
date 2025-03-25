//
//  FilterView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 02.03.2025.
//

import SwiftUI

struct FilterView: View {
    @EnvironmentObject private var viewModel: CarriersViewModel
    @EnvironmentObject private var router: Router
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Время отправления")
                .font(.system(size: 24, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            Group {
                Toggle(isOn: Binding(
                    get: { viewModel.filter.morning },
                    set: { _ in viewModel.filterSelected(.morning) }
                )) {
                    Text("Утро 06:00 - 12:00")
                }
                Toggle(isOn: Binding(
                    get: { viewModel.filter.afternoon },
                    set: { _ in viewModel.filterSelected(.afternoon) }
                )) {
                    Text("День 12:00 - 18:00")
                }
                Toggle(isOn: Binding(
                    get: { viewModel.filter.evening },
                    set: { _ in viewModel.filterSelected(.evening) }
                )) {
                    Text("Вечер 18:00 - 00:00")
                }
                Toggle(isOn: Binding(
                    get: { viewModel.filter.night },
                    set: { _ in viewModel.filterSelected(.night) }
                )) {
                    Text("Ночь 00:00 - 06:00")
                }
            }
            .toggleStyle(Checkbox(checkboxType: .square))
            
            Text("Показывать варианты с пересадками")
                .font(.system(size: 24, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            Group {
                Toggle(isOn: Binding(
                    get: { viewModel.filter.transferYes },
                    set: { _ in viewModel.filterSelected(.transferYes) }
                )) {
                    Text("Да")
                }
                Toggle(isOn: Binding(
                    get: { viewModel.filter.transferNo },
                    set: { _ in viewModel.filterSelected(.transferNo) }
                )) {
                    Text("Нет")
                }
            }
            .toggleStyle(Checkbox(checkboxType: .circle))
            
            Spacer()
            
            Button(action: { router.pop() }) {
                HStack {
                    Text("Применить")
                        .fontWeight(.bold)
                        .foregroundStyle(.whiteUniversal)
                }
                .frame(maxWidth: .infinity, maxHeight: Constants.buttonHeight)
                .background() {
                    RoundedRectangle(cornerRadius: Constants.cornerRadiusMedium)
                        .fill(.blueUniversal)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, Constants.paddingLarge)
            .opacity(viewModel.isActiveFilter ? 1 : 0)
        }
        .background(.whiteTS)
        .modifier(NavigationBarStyle(title: ""))
    }
}
