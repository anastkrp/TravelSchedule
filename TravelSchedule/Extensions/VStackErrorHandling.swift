//
//  VStackErrorHandling.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 01.03.2025.
//

import SwiftUI

public struct VStackErrorHandling<Content: View>: View {
    let errorType: ErrorHandlingType?
    @ViewBuilder var content: Content
    
    private var errorTitle: String {
        errorType == .serverError ? "Ошибка сервера" : "Нет интернета"
    }
    private var errorImage: String {
        errorType == .serverError ? "ServerError" : "NoInternet"
    }
    
    public var body: some View {
        if errorType == .serverError || errorType == .noInternetConnection {
            VStack {
                Image(errorImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: Constants.imageErrorSize, height: Constants.imageErrorSize)
                Text(errorTitle)
                    .font(.system(size: 24, weight: .bold))
                    .padding(.vertical)
            }
            .frame(maxHeight: .infinity)
        } else {
            VStack {
                content
            }
        }
    }
}
