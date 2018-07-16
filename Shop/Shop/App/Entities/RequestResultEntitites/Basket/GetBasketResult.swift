import Foundation

struct GetBasketResult: Codable {
    let amount: Int
    let countGoods: Int
    var contents: [ProductInfo]
}

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
