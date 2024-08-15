//
//  MockDessertsDataSource.swift
//  Fetch App
//
//  Created by Samuel Hinshelwood Jr. on 8/15/24.
//

import Foundation

struct MockDessertsDataSource: DessertsDataSource {
    func fetchDesserts() async -> Result<DessertPreview, any Error> {
        return .success(.init(strMeal: "Apple & Blackberry Crumble",
                              strMealThumb: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
                              idMeal: 52893)) // TODO
    }
}
