//
//  DessertsViewModel.swift
//  Fetch App
//
//  Created by Samuel Hinshelwood Jr. on 8/15/24.
//

import Foundation

class DessertsViewModel: ObservableObject {
    @Published var desserts: DessertList
    let dataSource: DessertsDataSource
    
    init(desserts: DessertList, dataSource: DessertsDataSource) {
        self.desserts = desserts
        self.dataSource = dataSource
    }
}
