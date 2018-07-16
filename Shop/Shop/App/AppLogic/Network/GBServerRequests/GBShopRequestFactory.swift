import Alamofire
import Foundation

class GBShopRequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        var manager = SessionManager(configuration: configuration)
        //manager = Alamofire.SessionManager.default
        return manager
    }()
    
    lazy var commonSessionConfig: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        var manager = SessionManager(configuration: configuration)
        //manager = Alamofire.SessionManager.default
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAuthRequestFactory() -> AuthRequestsFactory {
        let errorParser = makeErrorParser()
        return AuthService(errorParser: errorParser,
                    sessionManager: commonSessionManager,
                    queue: sessionQueue)
    }
    
    func makePersonalDataRequestFactory() -> UserDataRequestsFactory {
        let errorParser = makeErrorParser()
        
        return UserDataService(errorParser: errorParser,
                                           sessionManager: commonSessionManager,
                                           queue: sessionQueue)
    }
    
    func makeShopRequestsFactory() -> CatalogRequestsFactory {
        let errorParser = makeErrorParser()
        return CatalogService(errorParser: errorParser,
                           sessionManager: commonSessionManager,
                           queue: sessionQueue)
    }
}
