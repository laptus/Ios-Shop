import Alamofire
import OHHTTPStubs
@testable import Shop
import XCTest

class AuthRequestsTest: XCTestCase {
    var errorParser: ErrorParserStub!
    
    var authFactory: AuthRequestFactory?
    
    override func setUp() {
        super.setUp()
        let requestFactory = GeekBrainsRequestFactoryMock()
        authFactory = requestFactory.makeAuthRequestFactory()
    }
    
    override func tearDown() {
        super.tearDown()
        authFactory = nil
        OHHTTPStubs.removeAllStubs()
    }
    
    func testAuth() {
        let exp = XCTestExpectation(description: "Download https://failURL")
        let fileUrl = Bundle.main.url(forResource: "loginStub", withExtension: "json")!
        stub(condition: isMethodGET() &&
            pathEndsWith("login.json")) { result in
                return OHHTTPStubsResponse(fileURL: fileUrl, statusCode: 200, headers: nil)
        }
        var user: LoginResult?
        authFactory?.login(username: "someone", password: "password", completionHandler: {response in
            user = response.value
             exp.fulfill()
        })
        wait(for: [exp], timeout: 1.0)
        XCTAssertNil(user)
    }
}
