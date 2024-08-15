//
//  MockDessertsDataSource.swift
//  Fetch App
//
//  Created by Samuel Hinshelwood Jr. on 8/15/24.
//

import Foundation

struct MockDessertsDataSource: DessertsDataSource {
    func fetchDesserts() async -> Result<DessertPreview, any Error> {
        return .success(.init()) // TODO
    }
}
