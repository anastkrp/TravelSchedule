//
//  InfoRow.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 04.03.2025.
//

import SwiftUI

struct InfoRow: View {
    let type: InfoRowType
    let link: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(type.title)
            if let url = type.linkType(link: link) {
                Link(destination: url) {
                    Text(link)
                        .font(.caption)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: Constants.rowHeight, alignment: .leading)
        .padding(.horizontal)
    }
}
