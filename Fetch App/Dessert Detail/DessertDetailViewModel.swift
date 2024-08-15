//
//  DessertDetailViewModel.swift
//  Fetch App
//
//  Created by Samuel Hinshelwood Jr. on 8/15/24.
//

import Foundation

class DessertDetailViewModel: ObservableObject {
    let dataSource: DessertInfoDataSource
    @Published var dessert: DessertInfo
    
    init(dessert: DessertInfo, dataSource: DessertInfoDataSource) {
        self.dessert = dessert
        self.dataSource = dataSource
    }
}
