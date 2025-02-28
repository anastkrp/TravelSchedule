//
//  Router.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 26.02.2025.
//

import Foundation

final class Router: ObservableObject {
    @Published var path = [Route]()
    
    func push(_ path: Route) {
        self.path.append(path)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeAll()
    }
}
