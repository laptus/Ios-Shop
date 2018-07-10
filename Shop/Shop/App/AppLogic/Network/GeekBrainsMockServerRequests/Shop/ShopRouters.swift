import Alamofire
import Foundation

extension ShopRequest {
    struct CatalogRouter: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = "catalogData.json"
        var parameters: Parameters? {
            return ["page_number": pageNumber,
                    "id_category": cetegoryId]
        }
        
        let pageNumber: Int
        let cetegoryId: Int
    }
    
    struct GoodRouter: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = ""
        var parameters: Parameters? {
            return ["id_product": productId]
        }
        
        let productId: Int
    }
}
