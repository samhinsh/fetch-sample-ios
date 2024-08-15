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
        HStack(spacing: 14) {
            AsyncImage(url: .init(string: dessert.strMealThumb)) { phase in
                switch phase {
                case .empty, .failure:
                    Color.white
                        .frame(width: 100, height: 100)
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .frame(width: 100, height: 100)
                default:
                    Color.white
                }
            }
            
            Text(dessert.strMeal)
                .font(.callout)
                .fontWeight(.medium)
        }
    }
}

#Preview {
    DessertPreviewView(dessert: .init(strMeal: "Apple & Blackberry Crumble",
                                      strMealThumb: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
                                      idMeal: "52893"))
}
