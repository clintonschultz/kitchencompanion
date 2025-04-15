//
//  AddLocalRecipeForm.swift
//  BiteWise
//
//  Created by Clinton Schultz on 3/23/25.
//

import SwiftUI

struct AddLocalRecipeForm: View {
    @State private var recipeName: String = ""
    @State private var ingredients: String = ""
    @State private var instructions: String = ""
    @State private var isRecipeSaved: Bool = false
    
    var viewModel: LocalRecipesSearchViewModel

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    // Recipe Name
                    Section(header: Text("Recipe Name")) {
                        TextField("Enter recipe name", text: $recipeName)
                    }

                    // Ingredients
                    Section(header: Text("Ingredients")) {
                        TextEditor(text: $ingredients)
                            .frame(height: 100)
                            .border(Color.gray, width: 1)
                    }

                    // Instructions
                    Section(header: Text("Instructions")) {
                        TextEditor(text: $instructions)
                            .frame(height: 100)
                            .border(Color.gray, width: 1)
                    }

                    // Save button
                    Button(action: {
                        saveRecipe()
                    }) {
                        Text("Save Recipe")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .disabled(recipeName.isEmpty || ingredients.isEmpty || instructions.isEmpty)
                }
                .frame(maxHeight: 600) // Limit the form to a max height (prevents it from taking up the whole screen)

                // Display message if recipe is saved
                if isRecipeSaved {
                    Text("Recipe Saved!")
                        .foregroundColor(.green)
                        .padding()
                }

                // List of saved recipes
                if !viewModel.recipes.isEmpty {
                    List(viewModel.recipes) { recipe in
                        VStack(alignment: .leading) {
                            Text(recipe.name)
                                .font(.headline)
                                .padding(.bottom, 4.0)
                            Text("Ingredients: \(recipe.ingredients)")
                                .font(.subheadline)
                            Text("Instructions: \(recipe.instructions)")
                                .font(.subheadline)
                                .lineLimit(2)
                        }
                    }
                    .padding()
                } else {
                    // Display a message when no recipes are available
                    Text("No recipes saved yet.")
                        .foregroundColor(.gray)
                        .padding()
                }

                Spacer()
            }
            .navigationBarTitle("Create Recipe", displayMode: .inline)
        }
    }

    func saveRecipe() {
        let newRecipe = Recipe(name: recipeName, ingredients: ingredients, instructions: instructions)
        viewModel.saveRecipe(newRecipe: newRecipe)
        resetForm()
        isRecipeSaved = true
    }

    func resetForm() {
        recipeName = ""
        ingredients = ""
        instructions = ""
    }
}

#Preview {
    AddLocalRecipeForm(viewModel: LocalRecipesSearchViewModel())
}
