import Alamofire
import Foundation

class AbstractServerRequestFactory {
    static func returnGeekBrainsRequestFactory() -> IServerRequestFactory {
        return GBShopRequestFactory()
    }
    
    static func returnVaporRequestFactory() -> IServerRequestFactory {
        return GBShopRequestFactory()
    }
}
