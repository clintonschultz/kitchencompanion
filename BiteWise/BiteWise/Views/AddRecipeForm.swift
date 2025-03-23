//
//  AddRecipeForm.swift
//  BiteWise
//
//  Created by Clinton Schultz on 3/23/25.
//

import SwiftUI

struct Recipe: Identifiable {
    var id = UUID()  // Unique identifier for each recipe
    var name: String
    var ingredients: String
    var instructions: String
}

struct AddRecipeForm: View {
    @State private var recipes: [Recipe] = []
    @State private var recipeName: String = ""
    @State private var ingredients: String = ""
    @State private var instructions: String = ""
    @State private var isRecipeSaved: Bool = false  // Track if the recipe was saved

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
                if !recipes.isEmpty {
                    List(recipes) { recipe in
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

                Spacer()  // Ensure the content is pushed up, and the bottom is not blank
            }
            .navigationBarTitle("Create Recipe", displayMode: .inline)
        }
    }

    // Function to save the recipe
    func saveRecipe() {
        let newRecipe = Recipe(name: recipeName, ingredients: ingredients, instructions: instructions)
        recipes.append(newRecipe)  // Add the new recipe to the array
        resetForm()  // Reset the form for the next recipe
        isRecipeSaved = true
    }

    // Function to reset the form after saving
    func resetForm() {
        recipeName = ""
        ingredients = ""
        instructions = ""
    }
}

#Preview {
    AddRecipeForm()
}
