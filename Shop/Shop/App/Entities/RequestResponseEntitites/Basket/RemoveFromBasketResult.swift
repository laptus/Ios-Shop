import Foundation

/// answer for removing good from basket request
struct RemoveFromBasketResult: Codable {
    
    /**
     - result: request result (> 0 - successful)
     */
    let result: Int
}
