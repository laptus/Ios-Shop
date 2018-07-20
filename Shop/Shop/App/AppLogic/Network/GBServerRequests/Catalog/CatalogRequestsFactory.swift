import Alamofire
import Foundation

protocol CatalogRequestsFactory {
    func goods(page: Int,
               categoryId: Int,
               completionHandler: @escaping RequestVoidCompletion<[GoodOnPageResult]>)
    
    func good(goodId: Int,
              completionHandler: @escaping RequestVoidCompletion<GetGoodResult>)
    
    func addReview(idUser: Int,
                   text: String,
                   completionHandler: @escaping RequestVoidCompletion<AddReviewResult>)
    
    func approveReview(idComment: Int,
                       completionHandler: @escaping RequestVoidCompletion<ApproveReviewResult>)
    
    func removeReview(idComment: Int,
                      completionHandler: @escaping RequestVoidCompletion<RemoveReviewResult>)
}
