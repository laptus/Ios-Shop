import Foundation

/// response for adding review
struct AddReviewResult: Codable {
    
    /**
     - result: request result (> 0 - successful)
     - userMessage: message
     */

    let result: Int
    let userMessage: String
}
