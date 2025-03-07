//
//  SearchBar.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 28.02.2025.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: Constants.searchBarCornerRadius)
                .fill(.grayTS)
                .frame(height: Constants.searchBarHeight)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: Constants.iconWidthHeight, height: Constants.iconWidthHeight)
                    .foregroundColor(.grayUniversal)
                
                TextField("Введите запрос", text: $searchText)
                
                Button(action: {
                    searchText.removeAll()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: Constants.iconWidthHeight, height: Constants.iconWidthHeight)
                        .foregroundColor(.grayUniversal)
                }
                .opacity(searchText.isEmpty ? 0 : 1)
            }
            .padding(.horizontal, Constants.paddingSmall)
        }
        .padding([.horizontal, .bottom])
    }
}

#Preview {
    SearchBar(searchText: .constant(""))
}
