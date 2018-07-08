import Alamofire
import Foundation

class AbstractServerRequestFactory {
    static func returnGeekBrainsRequestFactory() -> IServerRequestFactory {
        return GeekBrainsRequestFactory()
    }
    
    static func returnVaporRequestFactory() -> IServerRequestFactory {
        return GeekBrainsRequestFactory()
    }
}
