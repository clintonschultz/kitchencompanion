//
//  RecipesSearch.swift
//  BiteWise
//
//  Created by Clinton Schultz on 3/23/25.
//

import SwiftUI

struct RecipesSearch: View {
    @State private var searchQuery: String = ""  // Store the search query entered by the user
    @State private var recipes: [String] = []  // Store search results (currently an empty array)
    @State private var isSearching = false  // Track search state (loading indicator)
    @State private var isNavigationActive = false // Used to trigger the navigation link to add recipe screen

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
                            recipes = []  // Clear results if the search query is empty
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

                // List of Recipes (Results will be shown here once the search is complete)
                List(recipes, id: \.self) { recipe in
                    Text(recipe)  // This is where the search results will be displayed
                }
                .padding()

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
            destination: AddRecipeForm(),
            isActive: $isNavigationActive,
            label: { EmptyView() }
        )
    }

    // Function to simulate searching (replace with real data fetching logic later)
    func searchRecipes(query: String) {
        // Simulate loading state until data is hooked up
        isSearching = true

        // Simulate a delay for search operation (replace this with actual API call later)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            // Example data for development
            if query.lowercased() == "pizza" {
                recipes = ["Margherita Pizza", "Pepperoni Pizza", "Vegetarian Pizza"]
            } else if query.lowercased() == "pasta" {
                recipes = ["Spaghetti Carbonara", "Penne Arrabbiata", "Fettuccine Alfredo"]
            } else {
                recipes = []  // No results found
            }
            isSearching = false  // Hide loading indicator after "searching"
        }
    }
}

#Preview {
    RecipesSearch()
}


//import SwiftUI
//
//struct RecipesSearch: View {
//    @State private var isNavigationActive = false
//
//    var body: some View {
//        NavigationView {
//            VStack(alignment: .leading) {
//                HStack(alignment: .center) {
//                    Text("Search For Recipes")
//                        .padding()
//                    Spacer()
//                }
//                Spacer()
//                
//            }
//            .navigationBarTitle("Recipes", displayMode: .inline)
//            .navigationBarItems(trailing: Button(action: {
//                isNavigationActive = true
//            }) {
//                Image(systemName: "plus")
//            })
//        }
//
//        NavigationLink(
//            destination: AddRecipeForm(),
//            isActive: $isNavigationActive,
//            label: { EmptyView() }
//        )
//    }
//}
//
//#Preview {
//    RecipesSearch()
//}
