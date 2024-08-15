//
//  DessertDetailView.swift
//  Fetch App
//
//  Created by Samuel Hinshelwood Jr. on 8/15/24.
//

import SwiftUI

struct DessertDetailView: View {
    @StateObject var viewModel: DessertDetailViewModel
    
    var body: some View {
        Text("Dessert Detail")
    }
}

#Preview {
    DessertDetailView(viewModel: .init(dessert: MockDessertInfoDataSource.mockDessert(), dataSource: MockDessertInfoDataSource()))
}
