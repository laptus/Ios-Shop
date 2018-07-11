import Foundation

struct GoodResult: Codable {
    let productName: Int
    let productPrice: String
    let productDescription: String
    
    enum CodigKeys: String, CodingKey {
        case result
        case productName = "product_mame"
        case productPrice = "product_price"
        case productDescription = "product_description"
    }
}
