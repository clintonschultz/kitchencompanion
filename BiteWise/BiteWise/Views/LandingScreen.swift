//
//  LandingScreen.swift
//  BiteWise
//
//  Created by Clinton Schultz on 3/23/25.
//

import SwiftUI

struct LandingScreen: View {
    var body: some View {
            NavigationView {
                VStack {
                    HStack {
                        Spacer()
                        Text("Welcome to BiteWise App")
                            .padding()
                        Spacer()
                    }

                    NavigationLink(destination: RecipesSearch()) {
                        Text("Recipes")
                            .foregroundColor(.blue)
                            .padding()
                            .background(Capsule().fill(Color.blue.opacity(0.1)))
                    }

                    Spacer()
                }
                .padding()
                .navigationBarTitle("Home", displayMode: .inline)  // Navigation bar title
                .navigationBarItems(trailing: Button(action: {
                    print("Edit button pressed")
                }) {
                    Image(systemName: "pencil")
                })
            }
        }
}

#Preview {
    LandingScreen()
}

