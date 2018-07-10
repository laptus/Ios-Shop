import Alamofire
import Foundation

class GBShopRequestFactory: IServerRequestFactory {
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
    
    func makeAuthRequestFactory() -> Authorizing {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSessionManager, queue: sessionQueue)
    }
    
    func makePersonalDataRequestFactory() -> PersonalInformationRequestsFactory {
        let errorParser = makeErrorParser()
        return PersonalInformationRequests(errorParser: errorParser, sessionManager: commonSessionManager, queue: sessionQueue)
    }
}
