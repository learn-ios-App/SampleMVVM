
import Foundation

struct User: Identifiable, Codable {
    var id = UUID()
    let name: String
    let isAdalt: Bool 
}
