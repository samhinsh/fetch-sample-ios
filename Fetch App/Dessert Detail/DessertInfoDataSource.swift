//
//  DessertInfoDataSource.swift
//  Fetch App
//
//  Created by Samuel Hinshelwood Jr. on 8/15/24.
//

import Foundation

protocol DessertInfoDataSource {
    func fetchDessertInfo() async -> Result<DessertInfo, Error>
}
