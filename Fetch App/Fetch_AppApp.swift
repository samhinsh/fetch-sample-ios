//
//  Fetch_AppApp.swift
//  Fetch App
//
//  Created by Samuel Hinshelwood Jr. on 8/15/24.
//

import SwiftUI

@main
struct Fetch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            DessertListLoadingView(dataSource: DessertListAPIEndpoint(),
                                dessertInfoDataSource: DessertInfoAPIEndpoint())
        }
    }
}
