//
//  LocalRecipesSearch.swift
//  BiteWise
//
//  Created by Clinton Schultz on 3/23/25.
//

import SwiftUI

struct LocalRecipesSearch: View {
    @State private var searchQuery: String = ""  // Store the search query entered by the user
    @State private var searchedRecipes: [Recipe] = []  // Store search results (currently an empty array)
    @State private var isSearching = false  // Track search state (loading indicator)
    @State private var isNavigationActive = false // Used to trigger the navigation link to add recipe screen
    
    var viewModel: LocalRecipesSearchViewModel

    var body: some View {
        NavigationView {
            VStack {
                TextField("Search for a recipe...", text: $searchQuery)
                    .padding(8.0)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding([.leading, .trailing])
                    .onChange(of: searchQuery) { newQuery in
                        // Trigger the search whenever the query changes
                        if !newQuery.isEmpty {
                            searchRecipes(query: newQuery)
                        } else {
                            searchedRecipes = []  // Clear results if the search query is empty
                        }
                    }

                // Optional: Search Button
                Button(action: {
                    searchRecipes(query: searchQuery)  // Trigger search when button is pressed
                }) {
                    Text("Search")
                        .frame(maxWidth: .infinity)
                        .padding(8.0)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
                .padding([.leading, .trailing])
                .disabled(searchQuery.isEmpty)  // Disable if no query entered

                // Show loading indicator while searching
                if isSearching {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                }

                if !searchedRecipes.isEmpty {
                    List(searchedRecipes, id: \.self) { recipe in
                        VStack(alignment: .leading) {
                            Text("Name: \(recipe.name)")
                            Text("Ingredients: \(recipe.ingredients)")
                            Text("Instructions: \(recipe.instructions)")
                        }
                    }
                    .id(UUID())
                    .padding()
                }
                
                if searchedRecipes.isEmpty && !searchQuery.isEmpty {
                    Text("No recipes matched your search.")
                        .padding()
                }

                Spacer()  // To push content up and fill screen
            }
            .navigationBarTitle("Recipe Search", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                isNavigationActive = true
            }) {
                Image(systemName: "plus")
            })
        }

        NavigationLink(
            destination: AddLocalRecipeForm(viewModel: viewModel),
            isActive: $isNavigationActive,
            label: { EmptyView() }
        )
    }

    // Function to simulate searching (replace with real data fetching logic later)
    private func searchRecipes(query: String) {
        // Simulate loading state until data is hooked up
        isSearching = true

        // Simulate a delay for search operation (replace this with actual API call later)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            searchedRecipes = self.viewModel.recipes.filter { $0.name.lowercased().contains(query.lowercased()) }
            isSearching = false  // Hide loading indicator after "searching"
        }
    }
}

#Preview {
    LocalRecipesSearch(viewModel: LocalRecipesSearchViewModel())
}
