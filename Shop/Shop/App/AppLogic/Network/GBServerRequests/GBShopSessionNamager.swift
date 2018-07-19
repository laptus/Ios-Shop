import Alamofire
import Foundation

/// abstract service class
class GBShopSessionManager: GenericRequest {
    
    var errorParser: AbstractErrorParser
    var sessionManager: SessionManager
    var queue: DispatchQueue?
    // swiftlint:disable force_unwrapping
    let baseUrl: URL = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    // swiftlint:enable force_unwrapping
    
    init(errorParser: AbstractErrorParser,
         sessionManager: SessionManager,
         queue: DispatchQueue? ) {
        
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        if let unwrapedQeue = queue {
            self.queue = unwrapedQeue
        } else {
            self.queue = DispatchQueue.global(qos: .utility)
        }
    }
}
