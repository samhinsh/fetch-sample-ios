//
//  MockDessertInfoDataSource.swift
//  Fetch App
//
//  Created by Samuel Hinshelwood Jr. on 8/15/24.
//

import Foundation

struct MockDessertInfoDataSource: DessertInfoDataSource {
    
    func fetchDessertInfo(dessertId: String) async -> Result<DessertInfo, any Error> {
        return .success(.init())
    }
}
