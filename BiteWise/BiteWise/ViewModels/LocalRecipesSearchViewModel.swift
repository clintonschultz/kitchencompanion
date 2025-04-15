//
//  LocalRecipesSearchViewModel.swift
//  BiteWise
//
//  Created by Clinton Schultz on 4/15/25.
//

import SwiftUI

class LocalRecipesSearchViewModel: ObservableObject {
    let coordinator = RecipesCoordinator.shared
    
    var recipes: [Recipe] {
        coordinator.recipes
    }
    
    func saveRecipe(newRecipe: Recipe) {
        coordinator.recipes.append(newRecipe)
    }
}
