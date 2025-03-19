//
//  ProgressBar.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 17.03.2025.
//

import SwiftUI

struct ProgressBar: View {
    let numberOfSections: Int
    let progress: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: Constants.progressCornerRadius)
                    .frame(
                        width: geometry.size.width,
                        height: Constants.progressHeight
                    )
                    .foregroundStyle(.whiteUniversal)
                
                RoundedRectangle(cornerRadius: Constants.progressCornerRadius)
                    .frame(
                        width: min(progress * geometry.size.width, geometry.size.width),
                        height: Constants.progressHeight
                    )
                    .foregroundStyle(.blueUniversal)
            }
            .mask(MaskView(numberOfSections: numberOfSections))
        }
    }
}

private struct MaskFragmentView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: Constants.progressCornerRadius)
            .fixedSize(horizontal: false, vertical: true)
            .frame(height: Constants.progressHeight)
            .foregroundStyle(.whiteUniversal)
    }
}

private struct MaskView: View {
    let numberOfSections: Int
    
    var body: some View {
        HStack {
            ForEach(0..<numberOfSections, id: \.self) { _ in
                MaskFragmentView()
            }
        }
    }
}
