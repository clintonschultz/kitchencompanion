import SwiftUI

struct Recipe: Hashable, Identifiable {
    var id = UUID()
    var name: String
    var ingredients: String
    var instructions: String
}
