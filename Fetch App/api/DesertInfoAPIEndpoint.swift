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
        let result: Result<DessertInfoContainer, Error> = await fetchData(urlRequest: request)
        
        switch result {
        case .success(let container):
            guard let info = container.meals.first else {
                return .failure(FetchError.some(message: "Couldn't get data from meals object"))
            }
            return .success(info)
        case .failure(let error):
            return .failure(error)
        }
    }
}
