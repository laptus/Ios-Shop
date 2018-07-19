import Foundation

/// answer for register request
struct RegisterResult: Codable {
    
    /**
     - result: request result (> 0 - successful)
     - userMessage: message
     */
    let result: Int
    let userMessage: String
}
