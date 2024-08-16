//
//  DessertListAPIEndpoint.swift
//  Fetch App
//
//  Created by Samuel Hinshelwood Jr. on 8/15/24.
//

import Foundation

struct DessertListAPIEndpoint: DessertsDataSource {
    func fetchDesserts() async -> Result<DessertList, any Error> {
        let endpoint = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        guard let url = URL(string: endpoint) else { return .failure(FetchError.some(message: "Invalid url"))}
        let request = URLRequest(url: url)
        return await fetchData(urlRequest: request)
    }
}

