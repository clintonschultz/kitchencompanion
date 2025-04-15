//
//  LocalRecipesSearchViewModelTests.swift
//  BiteWise
//
//  Created by Clinton Schultz on 4/15/25.
//

@testable import BiteWise
import Testing

struct LocalRecipesSearchViewModelTests {

    @Test
    func testSaveRecipe() {
        // Arrange
        let viewModel = LocalRecipesSearchViewModel()
        let newRecipe = Recipe(name: "Test Recipe", ingredients: "Test Ingredients", instructions: "Test Instructions")

        // Act
        viewModel.saveRecipe(newRecipe: newRecipe)

        // Assert
        #expect(viewModel.recipes.count == 1)
        #expect(viewModel.recipes.first?.name == "Test Recipe")
    }
}
