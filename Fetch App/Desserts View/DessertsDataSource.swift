//
//  DessertsDataSource.swift
//  Fetch App
//
//  Created by Samuel Hinshelwood Jr. on 8/15/24.
//

import Foundation

protocol DessertsDataSource {
    func fetchDesserts() async -> Result<DessertPreview, Error>
}
