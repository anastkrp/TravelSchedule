//
//  CloseButton.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 17.03.2025.
//

import SwiftUI

struct CloseButton: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        Button(action: {
            router.pop()
        }) {
            Image("ButtonClose")
        }
    }
}

#Preview {
    CloseButton()
}
