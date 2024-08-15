//
//  DessertDetailLoadingView.swift
//  Fetch App
//
//  Created by Samuel Hinshelwood Jr. on 8/15/24.
//

import SwiftUI

struct DessertDetailLoadingView: View {
    @SwiftUI.State private var state: State = .loading
    
    let dessertId: String
    let dataSource: DessertInfoDataSource
    
    init(dessertId: String, dataSource: DessertInfoDataSource) {
        self.dessertId = dessertId
        self.dataSource = dataSource
    }
    
    enum State {
        case loading
        case loaded(info: DessertInfo)
        case error
    }
    
    var body: some View {
        switch state {
        case .loading:
            ActivityIndicatorView()
                .task {
                    load()
                }
        case .loaded(let dessert):
            DessertDetailView(viewModel: .init(dessert: dessert, dataSource: dataSource))
        case .error:
            Color.clear // TODO: Show error message
        }
    }
    
    /// Load the underlying data powering the view.
    func load() {
        Task {
            let result = await dataSource.fetchDessertInfo(dessertId: dessertId)
            switch result {
            case .success(let dessertInfo):
                await MainActor.run {
                    self.state = .loaded(info: dessertInfo)
                }
            case .failure:
                await MainActor.run {
                    self.state = .error
                }
            }
        }
    }
}

#Preview {
    DessertDetailLoadingView(dessertId: "", dataSource: MockDessertInfoDataSource())
}
