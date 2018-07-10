import Alamofire
import Foundation
import OHHTTPStubs
@testable import Shop

class GeekBrainsRequestFactoryMock {
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParserStub()
    }
    
    lazy var commonSessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.ephemeral
        var manager = SessionManager(configuration: configuration)
        OHHTTPStubs.isEnabled(for: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAuthRequestFactory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSessionManager, queue: sessionQueue)
    }
    
    func makePersonalDataRequestFactory() -> PersonalDataRequestFactory {
        let errorParser = makeErrorParser()
        return PersonalDataRequests(errorParser: errorParser, sessionManager: commonSessionManager, queue: sessionQueue)
    }
    
    func makeShopRequestsFactory() -> ShopRequestsFactory {
        let errorParser = makeErrorParser()
        return ShopRequest(errorParser: errorParser,
                           sessionManager: commonSessionManager,
                           queue: sessionQueue)
    }
}
