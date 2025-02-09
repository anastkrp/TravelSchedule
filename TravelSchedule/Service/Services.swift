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
}
