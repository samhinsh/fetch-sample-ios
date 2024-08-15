//
//  DessertInfo.swift
//  Fetch App
//
//  Created by Samuel Hinshelwood Jr. on 8/15/24.
//

import Foundation

struct DessertInfo: Decodable {
    let mealId: String
    let mealName: String
    let drinkAlternate: String?
    let category: String?
    let area: String?
    let instructions: String?
    let thumbailUrl: String?
    let tags: [String]?
    let youtubeUrl: String?
    let ingredients: [Ingredient]?
    let source: String?
    let imageSource: String?
    let creativeCommonsConfirmed: String?
    let dateModified: String?
    
    struct Ingredient {
        let name: String
        let measure: String
    }
    
    enum CodingKeys: String, CodingKey {
        case meals = "meals"
        case idMeal = "idMeal"
        case strMeal = "strMeal"
        case strDrinkAlternate = "strDrinkAlternate"
        case strCategory = "strCategory"
        case strArea = "strArea"
        case strInstructions = "strInstructions"
        case strMealThumb = "strMealThumb"
        case strTags = "strTags"
        case strYoutube = "strYoutube"
        case strSource = "strSource"
        case strImageSource = "strImageSource"
        case strCreativeCommonsConfirmed = "strCreativeCommonsConfirmed"
        case dateModified = "dateModified"
    }
    
    struct IngredientNameKey: CodingKey {
        var stringValue: String
        
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        
        var intValue: Int?
        
        init?(intValue: Int) {
            self.intValue = intValue
            stringValue = "strIngredient\(intValue)"
        }
    }
    
    struct IngredientMeasureKey: CodingKey {
        var stringValue: String
        
        init?(stringValue: String) {
            return nil
        }
        
        var intValue: Int?
        
        init?(intValue: Int) {
            self.intValue = intValue
            stringValue = "strMeasure\(intValue)"
        }
    }
    
    init(mealId: String,
         mealName: String,
         drinkAlternate: String?,
         category: String?,
         area: String?,
         instructions: String?,
         thumbailUrl: String?,
         tags: [String]?,
         youtubeUrl: String?,
         ingredients: [Ingredient]?,
         source: String?,
         imageSource: String?,
         creativeCommonsConfirmed: String?,
         dateModified: String?) {
        self.mealId = mealId
        self.mealName = mealName
        self.drinkAlternate = drinkAlternate
        self.category = category
        self.area = area
        self.instructions = instructions
        self.thumbailUrl = thumbailUrl
        self.tags = tags
        self.youtubeUrl = youtubeUrl
        self.ingredients = ingredients
        self.source = source
        self.imageSource = imageSource
        self.creativeCommonsConfirmed = creativeCommonsConfirmed
        self.dateModified = dateModified
    }
    
    init(from decoder: any Decoder) throws {
        let outerContainer = try decoder.container(keyedBy: CodingKeys.self)
        let container = try outerContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .meals)
        self.mealId = try container.decode(String.self, forKey: .idMeal)
        self.mealName = try container.decode(String.self, forKey: .strMeal)
        self.drinkAlternate = try container.decodeIfPresent(String.self, forKey: .strDrinkAlternate)
        self.category = try container.decodeIfPresent(String.self, forKey: .strCategory)
        self.area = try container.decodeIfPresent(String.self, forKey: .strArea)
        self.instructions = try container.decodeIfPresent(String.self, forKey: .strInstructions)
        self.thumbailUrl = try container.decodeIfPresent(String.self, forKey: .strMealThumb)
        let tagsString = try container.decodeIfPresent(String.self, forKey: .strTags)
        self.tags = tagsString?.components(separatedBy: ",")
        self.youtubeUrl = try container.decodeIfPresent(String.self, forKey: .strYoutube)
        
        // parse ingredients
        let ingredientNamesContainer = try outerContainer.nestedContainer(keyedBy: IngredientNameKey.self, forKey: .meals)
        let ingredientMeasuresContainer = try outerContainer.nestedContainer(keyedBy: IngredientMeasureKey.self, forKey: .meals)
        
        var ingredients = [Ingredient]()
        var ingredientCounter = 1
        
        while true {
            // attempt to parse ingredient str and measure str for the given # while these keys exist
            // in their respective containers
            guard let ingredientNameKey = IngredientNameKey(intValue: ingredientCounter),
                    let ingredientMeasureKey = IngredientMeasureKey(intValue: ingredientCounter) else {
                break
            }
            
            if let name = try? ingredientNamesContainer.decodeIfPresent(String.self, forKey: ingredientNameKey),
               let measure = try? ingredientMeasuresContainer.decodeIfPresent(String.self, forKey: ingredientMeasureKey) {
                if !name.isEmpty && !measure.isEmpty {
                    ingredients.append(.init(name: name, measure: measure))
                }
                ingredientCounter += 1
            } else {
                break
            }
        }
        
        if ingredients.count > 0 {
            self.ingredients = ingredients
        } else {
            self.ingredients = nil
        }
        
        self.source = try container.decodeIfPresent(String.self, forKey: .strSource)
        self.imageSource = try container.decodeIfPresent(String.self, forKey: .strImageSource)
        self.creativeCommonsConfirmed = try container.decodeIfPresent(String.self, forKey: .strCreativeCommonsConfirmed)
        self.dateModified = try container.decodeIfPresent(String.self, forKey: .dateModified)
    }
}
