import Alamofire
import Foundation

class GBShopSessionManager: GenericRequest {
    var errorParser: AbstractErrorParser
    var sessionManager: SessionManager
    var queue: DispatchQueue?
    let baseUrl: URL = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(errorParser: AbstractErrorParser,
         sessionManager: SessionManager,
         queue: DispatchQueue? ){
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        if let q = queue {
            self.queue = q
        } else {
            self.queue = DispatchQueue.global(qos: .utility)
        }
    }
}
