import Alamofire
import Foundation

extension CatalogService {
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
    
    struct AddReviewRouter: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = "addReview.json"
        var parameters: Parameters? {
            return ["id_user": idUser,
                    "text": text]
        }
        
        let idUser: Int
        let text: String
    }
    
    struct ApproveReviewRouter: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = "approveReview.json"
        var parameters: Parameters? {
            return ["id_comment": idComment]
        }
        
        let idComment: Int
    }
    
    struct RemoveReviewRouter: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = "removeReview.json"
        var parameters: Parameters? {
            return ["id_comment": idComment]
        }
        
        let idComment: Int
    }
}
