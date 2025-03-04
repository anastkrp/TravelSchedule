//
//  InfoRow.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 04.03.2025.
//

import SwiftUI

struct InfoRow: View {
    let type: String
    let link: String
    
    var body: some View {
        if type == "mail" {
            VStack(alignment: .leading) {
                Text("E-mail")
                Link(destination: URL(string: "mailto:\(link)")!) {
                    Text(link)
                        .font(.caption)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: Constants.rowHeight, alignment: .leading)
            .padding(.horizontal)
        } else if type == "phone" {
            VStack(alignment: .leading) {
                Text("Телефон")
                Link(destination: URL(string: "tel:\(link)")!) {
                    Text(link)
                        .font(.caption)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: Constants.rowHeight, alignment: .leading)
            .padding(.horizontal)
        }
    }
}

#Preview {
    InfoRow(type: "mail", link: "mail@yandex.ru")
}
