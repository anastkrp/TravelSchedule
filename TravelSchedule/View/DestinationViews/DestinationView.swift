//
//  DestinationView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 21.02.2025.
//

import SwiftUI

struct DestinationView: View {
    let from: String
    let to: String
    let didTapFrom: () -> Void
    let didTapTo: () -> Void
    let didTapSwapButton: () -> Void
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(spacing: 0) {
                NameDestination(name: from, placeholder: "Откуда")
                    .onTapGesture(perform: didTapFrom)
                NameDestination(name: to, placeholder: "Куда")
                    .onTapGesture(perform: didTapTo)
            }
            .background(.whiteUniversal)
            .cornerRadius(Constants.cornerRadius)
            .padding(.trailing)
            
            Button(action: didTapSwapButton) {
                Image("Сhange")
                    .frame(
                        width: Constants.swapButtonSize,
                        height: Constants.swapButtonSize
                    )
            }
        }
        .padding()
        .background(.blueUniversal)
        .cornerRadius(Constants.cornerRadius)
    }
}

#Preview {
    DestinationView(from: "Москва", to: "", didTapFrom: {}, didTapTo: {}, didTapSwapButton: {})
}
