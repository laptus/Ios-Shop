import Foundation

/// answer for getting goods in basket request
struct GetContentsResult: Codable {
    
    /**
     - amount: goods cost
     - countGoods: goods count
     - contents: array of goods in basket
     */
    let amount: Int
    let countGoods: Int
    var contents: [ProductInfo]
}

/// product info in get basket response
struct ProductInfo: Codable {
    let idProduct: Int
    let productName: String
    let price: Int
    let quantity: Int
    
    enum CodingKeys: String, CodingKey {
        case idProduct = "id_product"
        case productName = "product_name"
        case price = "price"
        case quantity = "quantity"
    }
}
