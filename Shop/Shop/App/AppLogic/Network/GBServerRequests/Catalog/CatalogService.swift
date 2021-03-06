import Alamofire
import Foundation

class CatalogService: GBShopSessionManager {
}

extension CatalogService: CatalogRequestsFactory {
    
    func goods(page: Int,
               categoryId: Int,
               completionHandler: @escaping RequestVoidCompletion<[GoodOnPageResult]>) {
        
        let requestModel = CatalogRouter(baseURL: baseUrl, pageNumber: page, cetegoryId: categoryId)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
    
    func good(goodId: Int,
              completionHandler: @escaping RequestVoidCompletion<GetGoodResult>) {
        
        let requestModel = GoodRouter(baseURL: baseUrl, productId: goodId)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
    
    func addReview(idUser: Int,
                   text: String,
                   completionHandler: @escaping RequestVoidCompletion<AddReviewResult>) {
        
        let requestModel = AddReviewRouter(baseURL: baseUrl, idUser: idUser, text: text)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
    
    func approveReview(idComment: Int,
                       completionHandler: @escaping RequestVoidCompletion<ApproveReviewResult>) {
        
        let requestModel = ApproveReviewRouter(baseURL: baseUrl, idComment: idComment)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
    
    func removeReview(idComment: Int,
                      completionHandler: @escaping RequestVoidCompletion<RemoveReviewResult>) {
        
        let requestModel = RemoveReviewRouter(baseURL: baseUrl, idComment: idComment)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
}
