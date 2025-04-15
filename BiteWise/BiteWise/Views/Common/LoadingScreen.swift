//
//  LoadingScreen.swift
//  BiteWise
//
//  Created by Clinton Schultz on 3/23/25.
//

import SwiftUI

struct LoadingScreen: View {
    @State private var isLoadingComplete = false

    var body: some View {
        VStack {
            if isLoadingComplete {
                // After 3 seconds, show the Landing Page
                LandingScreen()
            } else {
                logo()
                    .padding()
                // Show a loading indicator while waiting
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
                    .onAppear {
                        // Simulate loading for 3 seconds, then transition
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation {
                                isLoadingComplete = true  // Set flag to show landing page
                            }
                        }
                    }
            }
        }
        .navigationBarHidden(true) // Hide navigation bar during the loading phase
    }

    @ViewBuilder
    private func logo() -> some View {
        VStack(alignment: .center, spacing: 8.0) {
            Image(systemName: "clock.fill")
                .resizable()
                .frame(width: 16.0, height: 16.0)
            Text("Food is Medicine")
                .font(.caption)
        }
    }
}

#Preview {
    LoadingScreen()
}
