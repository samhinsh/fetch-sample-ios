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
                LazyVGrid(columns: [.init()], alignment: .leading) {
                    ForEach(viewModel.desserts.meals, id: \.idMeal) { dessert in
                        NavigationLink {
                            DessertDetailLoadingView(dessertId: dessert.idMeal, dataSource: MockDessertInfoDataSource()) // TODO: Use real data source
                        } label: {
                            DessertPreviewView(dessert: dessert)
                                .foregroundStyle(Color.primary)
                                .padding(.horizontal)
                                .padding(.bottom, 8)
                        }
                    }
                }
            }
            .navigationTitle("Desserts")
        }
    }
}

#Preview {
    DessertsView(viewModel: .init(desserts: .init(meals: []), dataSource: MockDessertsDataSource()))
}
