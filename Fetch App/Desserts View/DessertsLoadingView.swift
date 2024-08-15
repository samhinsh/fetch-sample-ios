//
//  DessertsLoadingView.swift
//  Fetch App
//
//  Created by Samuel Hinshelwood Jr. on 8/15/24.
//

import SwiftUI

struct DessertsLoadingView: View {
    @SwiftUI.State var state: State = .loading
    let dataSource: DessertsDataSource
    
    init(dataSource: DessertsDataSource) {
        self.dataSource = dataSource
    }
    
    enum State {
        case loading
        case loaded(dessertList: DessertList)
        case error
    }
    
    var body: some View {
        switch state {
        case .loading:
            ActivityIndicatorView()
                .task {
                    load()
                }
        case .loaded(let dessertList):
            DessertsView(viewModel: .init(desserts: dessertList, dataSource: dataSource))
        case .error:
            Color.clear // TODO: Show appropriate error message
        }
    }
    
    /// Load the data for the view.
    func load() {
        Task {
            let result = await dataSource.fetchDesserts()
            switch result {
            case .success(let desserts):
                return await MainActor.run {
                    self.state = .loaded(dessertList: desserts)
                }
            case .failure:
                return await MainActor.run {
                    self.state = .error
                }
            }
        }
    }
}

#Preview {
    DessertsLoadingView(dataSource: MockDessertsDataSource())
}
