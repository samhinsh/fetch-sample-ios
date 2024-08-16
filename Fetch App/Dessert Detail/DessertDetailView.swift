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
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                
                // - MARK: Image
                AsyncImage(url: .init(string: viewModel.dessert.thumbailUrl ?? "")) { phase in
                    switch phase {
                    case .empty, .failure:
                        Color.white
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity, maxHeight: 400)
                            
                    default:
                        Color.clear
                    }
                }
                
                // - MARK: Recipe title metadata
                VStack {
                    Text(viewModel.dessert.mealName)
                        .font(.title)
                    
                    HStack {
                        if let category = viewModel.dessert.category, let area = viewModel.dessert.area {
                            Text(category)
                            Text("|")
                            Text(area)
                        } else if let category = viewModel.dessert.category {
                            Text(category)
                        } else if let area = viewModel.dessert.area {
                            Text(area)
                        }
                    }
                    
                    if let youtubeLink = viewModel.dessert.youtubeUrl, let youtubeUrl = URL(string: youtubeLink) {
                        Link(destination: youtubeUrl ) {
                            Text("YouTube")
                                .fontWeight(.medium)
                                .padding(.top, 1)
                        }
                    }
                }
                .padding([.horizontal, .top])
                .padding(.bottom, 8)
                
                // MARK: - Ingredients
                if let ingredients = viewModel.dessert.ingredients {
                    LazyVStack(alignment: .leading) {
                        ForEach(ingredients, id: \.id) { ingredient in
                            VStack {
                                HStack {
                                    Text(ingredient.name.capitalized)
                                        .fontWeight(.medium)
                                    Spacer()
                                    Text(ingredient.measure)
                                }
                                Divider()
                            }
                        }
                    }
                    .padding()
                }
                
                // MARK: - Instructions
                if let instructions = viewModel.dessert.instructions {
                    Section {
                        LazyVStack(alignment: .leading) {
                            Text(instructions)
                        }
                        .padding([.horizontal, .bottom])
                    } header: {
                        HStack {
                            Text("Instructions")
                                .bold()
                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.top, 8)
                        .padding(.bottom, 4)
                    }
                }
            }
        }
        .navigationTitle(viewModel.dessert.mealName)
    }
}

#Preview {
    DessertDetailView(viewModel: .init(dessert: MockDessertInfoDataSource.mockDessert(), dataSource: MockDessertInfoDataSource()))
}
