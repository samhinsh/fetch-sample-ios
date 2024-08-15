//
//  MockDessertInfoDataSource.swift
//  Fetch App
//
//  Created by Samuel Hinshelwood Jr. on 8/15/24.
//

import Foundation

struct MockDessertInfoDataSource: DessertInfoDataSource {
    static func mockDessert() -> DessertInfo {
        let instructions = "To make the pastry, measure the flour into a bowl and rub in the butter with your fingertips until the mixture resembles fine breadcrumbs. Add the water, mixing to form a soft dough.\r\nRoll out the dough on a lightly floured work surface and use to line a 20cm/8in flan tin. Leave in the fridge to chill for 30 minutes.\r\nPreheat the oven to 200C/400F/Gas 6 (180C fan).\r\nLine the pastry case with foil and fill with baking beans. Bake blind for about 15 minutes, then remove the beans and foil and cook for a further five minutes to dry out the base.\r\nFor the filing, spread the base of the flan generously with raspberry jam.\r\nMelt the butter in a pan, take off the heat and then stir in the sugar. Add ground almonds, egg and almond extract. Pour into the flan tin and sprinkle over the flaked almonds.\r\nBake for about 35 minutes. If the almonds seem to be browning too quickly, cover the tart loosely with foil to prevent them burning."
        let ingredients: [DessertInfo.Ingredient] = [
            .init(name: "plain flour", measure: "175g/6oz"),
            .init(name: "chilled butter" , measure: "75g/2½oz"),
            .init(name: "cold water", measure: "2-3 tbsp")
        ]
        return .init(mealId: "52767",
                     mealName: "Bakewell tart",
                     drinkAlternate: nil,
                     category: "Dessert",
                     area: "British",
                     instructions: instructions,
                     thumbailUrl: "https://www.themealdb.com/images/media/meals/wyrqqq1468233628.jpg",
                     tags: ["Tart", "Baking", "Alcoholic"],
                     youtubeUrl: "https://www.youtube.com/watch?v=1ahpSTf_Pvk",
                     ingredients: ingredients,
                     source: nil,
                     imageSource: nil,
                     creativeCommonsConfirmed: nil,
                     dateModified: nil)
    }
    
    func fetchDessertInfo(dessertId: String) async -> Result<DessertInfo, any Error> {
        try? await Task.sleep(nanoseconds: 1_000_000_000) // simulate latency
        return .success(MockDessertInfoDataSource.mockDessert())
    }
}
