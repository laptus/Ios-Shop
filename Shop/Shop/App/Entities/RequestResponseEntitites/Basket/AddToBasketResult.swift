import Foundation

/// answer for adding good to basket request
struct AddToBasketResult: Codable {
    
    /**
     - result: request result (> 0 - successful)
     */
    let result: Int
}
