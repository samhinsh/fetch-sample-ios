//
//  DessertPreviewView.swift
//  Fetch App
//
//  Created by Samuel Hinshelwood Jr. on 8/15/24.
//

import SwiftUI

struct DessertPreviewView: View {
    var dessert: DessertPreview
    var body: some View {
        Text(dessert.strMeal)
    }
}

#Preview {
    DessertPreviewView(dessert: .init(strMeal: "",
                                      strMealThumb: "",
                                      idMeal: ""))
}
