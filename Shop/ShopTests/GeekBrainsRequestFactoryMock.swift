import Alamofire
import Foundation
@testable import Shop

class GeekBrainsRequestFactoryStub {
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParserStub()
    }
    
    lazy var commonSessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.ephemeral
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
