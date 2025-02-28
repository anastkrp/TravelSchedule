//
//  NavigationBarStyle.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 28.02.2025.
//

import SwiftUI

struct NavigationBarStyle: ViewModifier {
    @EnvironmentObject var router: Router
    let title: String
    
    func body(content: Content) -> some View {
        content
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        router.pop()
                    }) {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .scaledToFit()
                            .frame(width: Constants.iconWidth, height: Constants.iconHeight)
                            .tint(.blackTS)
                    }
                }
            }
    }
}
