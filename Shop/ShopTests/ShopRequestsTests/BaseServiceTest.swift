import Alamofire
import OHHTTPStubs
@testable import Shop
import XCTest

class BaseServiceTest: XCTestCase {
    var errorParser: ErrorParserStub!
    
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        basketService = nil
        OHHTTPStubs.removeAllStubs()
    }
    
    func httpStub(pathEnd: String,
                  method: OHHTTPStubsTestBlock = isMethodGET()) {
        
        let fileName = pathEnd.split(separator: '.')[0]
        let fileExt = pathEnd.split(separator: '.')[1]
        // swiftlint:disable force_unwrapping
        let fileUrl = Bundle.main.url(forResource: fileName, withExtension: fileExt)!
        // swiftlint:enable force_unwrapping
        stub(condition: method &&
            pathEndsWith(pathEnd)) { _ in
                return OHHTTPStubsResponse(fileURL: fileUrl, statusCode: 200, headers: nil)
        }
    }
}
