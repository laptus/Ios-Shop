import Alamofire
import Foundation

protocol CatalogRequestsFactory {
    func goods(page: Int,
               categoryId: Int,
               completionHandler: @escaping (DataResponse<[GoodOnPageResult]>) -> Void)
    
    func good(goodId: Int,
              completionHandler: @escaping (DataResponse<GetGoodResult>) -> Void)
    
    func addReview(idUser: Int,
                   text: String,
                   completionHandler: @escaping (DataResponse<AddReviewResult>) -> Void)
    
    func approveReview(idComment: Int,
                       completionHandler: @escaping (DataResponse<ApproveReviewResult>) -> Void)
    
    func removeReview(idComment: Int,
                      completionHandler: @escaping (DataResponse<RemoveReviewResult>) -> Void)
}
