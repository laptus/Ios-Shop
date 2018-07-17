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
    
    func makeAuthRequestFactory() -> AuthRequestsFactory {
        let errorParser = makeErrorParser()
        return AuthService(errorParser: errorParser, sessionManager: commonSessionManager, queue: sessionQueue)
    }
    
    func makeUserDataRequestFactory() -> UserDataRequestsFactory {
        let errorParser = makeErrorParser()
        return UserDataService(errorParser: errorParser, sessionManager: commonSessionManager, queue: sessionQueue)
    }
    
    func makeCatalogRequestsFactory() -> CatalogRequestsFactory {
        let errorParser = makeErrorParser()
        return CatalogService(errorParser: errorParser,
                           sessionManager: commonSessionManager,
                           queue: sessionQueue)
    }
}
