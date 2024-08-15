//
//  DessertsViewModel.swift
//  Fetch App
//
//  Created by Samuel Hinshelwood Jr. on 8/15/24.
//

import Foundation

class DessertsViewModel: ObservableObject {
    let dataSource: DessertsDataSource
    
    init(dataSource: DessertsDataSource) {
        self.dataSource = dataSource
    }
}
