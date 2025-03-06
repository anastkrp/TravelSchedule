//
//  VStackErrorHandling.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 01.03.2025.
//

import SwiftUI

struct VStackErrorHandling<Content: View>: View {
    let errorType: ErrorHandlingType?
    @ViewBuilder var content: Content
    
    public var body: some View {
        ZStack {
            VStack {
                content
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.whiteTS)
            
            VStack {
                Image(errorType?.image ?? "ServerError")
                    .resizable()
                    .scaledToFit()
                    .frame(width: Constants.imageErrorSize, height: Constants.imageErrorSize)
                Text(errorType?.title ?? "")
                    .font(.system(size: 24, weight: .bold))
                    .padding(.vertical)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.whiteTS)
            .opacity(errorType == .serverError || errorType == .noInternetConnection ? 1 : 0)
        }
    }
}
