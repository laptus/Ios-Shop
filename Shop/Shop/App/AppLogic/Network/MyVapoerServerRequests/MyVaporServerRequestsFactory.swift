import Alamofire
import Foundation

class MyVaporServerRequestsFactory: IServerRequestFactory {
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
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAuthRequestFactory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSessionManager, queue: sessionQueue)
    }
    
    func makePersonalDataRequestFactory() -> PersonalDataRequestFactory {
        let errorParser = makeErrorParser()
        return PersonalDataRequest(errorParser: errorParser, sessionManager: commonSessionManager, queue: sessionQueue)
    }
}
