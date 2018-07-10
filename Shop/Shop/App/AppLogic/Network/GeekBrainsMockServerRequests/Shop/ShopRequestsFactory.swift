import Alamofire
import Foundation

protocol ShopRequestsFactory {
    func goods(page: Int,
               categoryId: Int,
               completionHandler: @escaping (DataResponse<GoodsOnPageResult>) -> Void)
    
    func good(goodId: Int,
              completionHandler: @escaping (DataResponse<GoodsOnPageResult>) -> Void)
}
