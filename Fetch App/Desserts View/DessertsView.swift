//
//  ContentView.swift
//  Fetch App
//
//  Created by Samuel Hinshelwood Jr. on 8/15/24.
//

import SwiftUI

struct DessertsView: View {
    @StateObject var viewModel: DessertsViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(viewModel.desserts.meals, id: \.idMeal) { dessert in
                    DessertPreviewView(dessert: dessert)
                        .padding()
                }
            }
        }
    }
}

#Preview {
    DessertsView(viewModel: .init(desserts: .init(meals: []), dataSource: MockDessertsDataSource()))
}
