import Alamofire
import Foundation

class CatalogRequest: GenericRequest {
    let errorParser: AbstractErrorParser
    let sessionManager: SessionManager
    let queue: DispatchQueue?
    let baseUrl: URL
    
    init(errorParser: AbstractErrorParser,
         sessionManager: SessionManager,
         queue: DispatchQueue? = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
        baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    }
}

extension CatalogRequest: CatalogRequestsFactory {
    func goods(page: Int, categoryId: Int,
               completionHandler: @escaping (DataResponse<[GoodOnPageResult]>) -> Void) {
        let requestModel = CatalogRouter(baseURL: baseUrl, pageNumber: page, cetegoryId: categoryId)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
    
    func good(goodId: Int,
              completionHandler: @escaping (DataResponse<GetGoodResult>) -> Void) {
        let requestModel = GoodRouter(baseURL: baseUrl, productId: goodId)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
}