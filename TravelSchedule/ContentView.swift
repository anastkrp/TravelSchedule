//
//  ContentView.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 08.02.2025.
//

import SwiftUI

struct ContentView: View {
    
    private let services = Services()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Проверка сетевых запросов \nAPI «Яндекс Расписаний»")
                .font(.title)
                .fontWeight(.bold)
            Text("для ревью")
            
            Spacer().frame(height: 30)
            
            Button("Расписание рейсов между станциями") {
                services.search()
            }
            Button("Расписание рейсов по станции") {
                services.schedule()
            }
            Button("Список станций следования") {
                services.thread()
            }
            Button("Список ближайших станций") {
                services.stations()
            }
            Button("Ближайший город") {
                services.settlement()
            }
            Button("Информация о перевозчике") {
                services.carrier()
            }
            Button("Копирайт Яндекс Расписаний") {
                services.copyright()
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
