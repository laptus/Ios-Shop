import Alamofire
import OHHTTPStubs
@testable import Shop
import XCTest

class AuthRequestsTest: XCTestCase {
    var errorParser: ErrorParserStub!
    
    var authFactory: AuthRequestsFactory?
    
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
    
    func testAuthLogin() {
        let exp = XCTestExpectation(description: "Download https://failURL")
        let fileUrl = Bundle.main.url(forResource: "loginStub", withExtension: "json")!
        stub(condition: isMethodGET() &&
            pathEndsWith("login.json")) { _ in
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
    
    func testAuthLogOut() {
        let exp = XCTestExpectation(description: "Download https://failURL")
        let fileUrl = Bundle.main.url(forResource: "loginStub", withExtension: "json")!
        stub(condition: isMethodGET() &&
            pathEndsWith("login.json")) { _ in
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
    
    func testAuthRegister() {
        let exp = XCTestExpectation(description: "Download https://failURL")
        let fileUrl = Bundle.main.url(forResource: "loginStub", withExtension: "json")!
        stub(condition: isMethodGET() &&
            pathEndsWith("login.json")) { _ in
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
