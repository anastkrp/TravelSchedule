//
//  Services.swift
//  TravelSchedule
//
//  Created by Anastasiia Ki on 08.02.2025.
//

import OpenAPIURLSession

final class Services {
    
    // MARK: - Private Properties
    
    private let key = Constants.apiKey
    
    // MARK: - Private Methods
    
    private func fetchData<T>(
        service: @escaping (Client) -> T,
        task: @escaping (T) async throws -> Void
    ) {
        do {
            let client = Client(
                serverURL: try Servers.Server1.url(),
                transport: URLSessionTransport()
            )
            
            let service = service(client)
            
            Task {
                try await task(service)
            }
        } catch {
            print("[fetchData]: Error fetching data - \(error)")
        }
    }
    
    // MARK: - Public Methods
    
    func stations() {
        fetchData { client in
            return NearestStationsService(
                client: client,
                apikey: self.key
            )
        } task: { service in
            let stations = try await service.getNearestStations(
                lat: 50.440046,
                lng: 40.4882367,
                distance: 50
            )
            print("Stations: \n\(stations)")
        }
    }
    
    func settlement() {
        fetchData { client in
            return NearestSettlementService(
                client: client,
                apikey: self.key
            )
        } task: { service in
            let settlement = try await service.getNearestSettlement(
                lat: 50.440046,
                lng: 40.4882367,
                distance: 50
            )
            print("Settlement: \n\(settlement)")
        }
    }
    
    func carrier() {
        fetchData { client in
            return CarrierService(
                client: client,
                apikey: self.key
            )
        } task: { service in
            let carriers = try await service.getCarrier(
                code: "TK",
                system: "iata"
            )
            print("Carriers: \n\(carriers)")
        }
    }
    
    func copyright() {
        fetchData { client in
            return CopyrightService(
                client: client,
                apikey: self.key
            )
        } task: { service in
            let copyright = try await service.getCopyright()
            print("Copyright: \n\(copyright)")
        }
    }
    
    func search() {
        fetchData { client in
            return SearchService(
                client: client,
                apikey: self.key
            )
        } task: { service in
            let search = try await service.search(
                from: "c146",
                to: "c213",
                date: "2025-02-10"
            )
            print("Search: \n\(search)")
        }
    }
    
    func schedule() {
        fetchData { client in
            return ScheduleService(
                client: client,
                apikey: self.key
            )
        } task: { service in
            let schedule = try await service.schedule(
                station: "s9612374",
                date: "2025-02-11"
            )
            print("Schedule: \n\(schedule)")
        }
    }
    
    func thread() {
        fetchData { client in
            return ThreadService(
                client: client,
                apikey: self.key
            )
        } task: { service in
            let thread = try await service.thread(uid: "028S_3_2")
            print("Thread: \n\(thread)")
        }
    }
            
    func stationsList() {
        fetchData { client in
            return StationsListService(
                client: client,
                apikey: self.key
            )
        } task: { service in
            print("Fetching stations list...")
            
            let stationsList = try await service.stationsList()
            
            guard let countries = stationsList.countries else {
                print("No countries found")
                return
            }
            print("Stations list: \n Example \n Found \(countries.count) countries")
        }
    }
}
