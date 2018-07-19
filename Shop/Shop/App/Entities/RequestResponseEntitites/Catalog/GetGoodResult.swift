import Foundation

/// struct for getting goods from catalog 
struct GetGoodResult: Codable {
    
    /**
     - result: request result (> 0 - successful)
     */
    let result: Int
    let name: String
    let price: Int
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case result
        case name = "product_name"
        case price = "product_price"
        case description = "product_description"
    }
}
