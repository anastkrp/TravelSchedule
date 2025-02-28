//
//  StationsView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 25.02.2025.
//

import SwiftUI

struct StationsView: View {
    @EnvironmentObject var router: Router
    let stations: [String]
    
    var body: some View {
        VStack {
            Button("back", action: {
                router.pop()
            })
            Button("root", action: {
                router.popToRoot()
            })
        }
    }
}

#Preview {
    StationsView(stations: [""])
}
