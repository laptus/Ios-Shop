import Alamofire
import Foundation

extension BasketService {
    struct AddToBasketRouter: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = "addToBasket.json"
        var parameters: Parameters? {
            return ["id_product": idPorduct,
                    "quantity": quantity]
        }
        
        let idPorduct: Int
        let quantity: Int
    }
    
    struct DeleteFromBasketRouter: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = "deleteFromBasket.json"
        var parameters: Parameters? {
            return ["id_product": idPorduct]
        }
        
        let idPorduct: Int
    }
    
    struct GetBasketRouter: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = "getBasket.json"
        var parameters: Parameters? {
            return ["id_user": idUser]
        }
        
        let idUser: Int
    }
}
