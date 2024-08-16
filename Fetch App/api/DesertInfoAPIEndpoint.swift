//
//  DesertInfoAPIEndpoint.swift
//  Fetch App
//
//  Created by Samuel Hinshelwood Jr. on 8/15/24.
//

import Foundation

struct DessertInfoAPIEndpoint: DessertInfoDataSource {
    func fetchDessertInfo(dessertId: String) async -> Result<DessertInfo, any Error> {
        let endpoint = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(dessertId)"
        guard let url = URL(string: endpoint) else {
            return .failure(FetchError.some(message: "Invalid url"))
        }
        let request = URLRequest(url: url)
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let container = try JSONDecoder().decode(DessertInfoContainer.self, from: data)
            guard let info = container.meals.first else {
                return .failure(FetchError.some(message: "Couldn't get data from meals object"))
            }
            return .success(info)
        } catch let error {
            print("API:: \(String(describing: error))")
            return .failure(error)
        }
    }
}
