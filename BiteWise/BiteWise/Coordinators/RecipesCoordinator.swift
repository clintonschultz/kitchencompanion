//
//  BiteWiseCoordinator.swift
//  BiteWise
//
//  Created by Clinton Schultz on 4/15/25.
//

import SwiftUI

/// The coordinator that handles state for the BiteWise app.
class RecipesCoordinator {
    /// The singleton instance of the coordinator to be shared.
    public static var currentCoordinator = RecipesCoordinator()
    
    public static var shared: RecipesCoordinator {
        get { currentCoordinator }
        set { currentCoordinator = newValue }
    }
    
    public var recipes: [Recipe] = []
}
