import Alamofire
import Foundation

extension CatalogRequest {
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
        let path: String = "getGoodById.json"
        var parameters: Parameters? {
            return ["id_product": productId]
        }
        
        let productId: Int
    }
}