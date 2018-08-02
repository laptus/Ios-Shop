import Alamofire
import Foundation

typealias RequestVoidCompletion<T> = (DataResponse<T>) -> Void

/// fabric of gbShop services
class GBShopServicesFactory {
    static var shopServicesFactory: GBShopServicesFactory?
    
    static func instance() -> GBShopServicesFactory {
        if let factory = shopServicesFactory {
            return factory
        } else {
            shopServicesFactory = GBShopServicesFactory.init()
            return shopServicesFactory!
        }
    }
    
    private func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    private lazy var commonSessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        
        var manager = SessionManager(configuration: configuration)
        return manager
    }()
    
    private let sessionQueue = DispatchQueue.global(qos: .utility)
    
    /**
     returns authtorization service
     */
    func makeAuthRequestFactory() -> AuthRequestsFactory {
        let errorParser = makeErrorParser()
        
        return AuthService(errorParser: errorParser,
                    sessionManager: commonSessionManager,
                    queue: sessionQueue)
    }
    
    /**
     returns user data service
     */
    func makePersonalDataRequestFactory() -> UserDataRequestsFactory {
        let errorParser = makeErrorParser()
        
        return UserDataService(errorParser: errorParser,
                                           sessionManager: commonSessionManager,
                                           queue: sessionQueue)
    }
    
    /**
     returns shop's catalog service
     */
    func makeCatalogRequestsFactory() -> CatalogRequestsFactory {
        let errorParser = makeErrorParser()
        
        return CatalogService(errorParser: errorParser,
                           sessionManager: commonSessionManager,
                           queue: sessionQueue)
    }
    
    /**
     returns basket service
     */
    func makeBasketRequestsFactory() -> BasketRequestsFactory {
        let errorParser = makeErrorParser()
        
        return BasketService(errorParser: errorParser,
                              sessionManager: commonSessionManager,
                              queue: sessionQueue)
    }
}
