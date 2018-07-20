import Foundation

/// response for approving review
struct ApproveReviewResult: Codable {
    
    /**
     - result: request result (> 0 - successful)
     */
    let result: Int
}
