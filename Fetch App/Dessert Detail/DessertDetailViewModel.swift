//
//  DessertDetailViewModel.swift
//  Fetch App
//
//  Created by Samuel Hinshelwood Jr. on 8/15/24.
//

import Foundation

class DessertDetailViewModel: ObservableObject {
    let dataSource: DessertInfoDataSource
    
    init(dataSource: DessertInfoDataSource) {
        self.dataSource = dataSource
    }
}
