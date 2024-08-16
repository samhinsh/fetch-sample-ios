//
//  fetchData.swift
//  Fetch App
//
//  Created by Samuel Hinshelwood Jr. on 8/15/24.
//

import Foundation

/// Perform a URL request for some data using the given request, attempting to decode the data into the specified type. 
func fetchData<DataType: Decodable>(urlRequest: URLRequest) async -> Result<DataType, Error> {
    do {
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        let result = try JSONDecoder().decode(DataType.self, from: data)
        return .success(result)
    } catch let error {
        print("API:: \(String(describing: error))")
        return .failure(error)
    }
}
