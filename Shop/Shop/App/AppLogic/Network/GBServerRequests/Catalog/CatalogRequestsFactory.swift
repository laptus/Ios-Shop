import Alamofire
import Foundation

protocol CatalogRequestsFactory {
    func goods(page: Int,
               categoryId: Int,
               completionHandler: @escaping (DataResponse<[GoodOnPageResult]>) -> Void)
    
    func good(goodId: Int,
              completionHandler: @escaping (DataResponse<GetGoodResult>) -> Void)
}
