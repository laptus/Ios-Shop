import Alamofire
import OHHTTPStubs
@testable import Shop
import XCTest

class PersonalDataRequestsTest: XCTestCase {
    var errorParser: ErrorParserStub!
    
    var perInfFactory: UserDataRequestsFactory?
    
    override func setUp() {
        super.setUp()
        let requestFactory = GeekBrainsRequestFactoryMock()
        perInfFactory = requestFactory.makePersonalDataRequestFactory()
    }
    
    override func tearDown() {
        super.tearDown()
        perInfFactory = nil
        OHHTTPStubs.removeAllStubs()
    }
    
    func testPersInfChange() {
        let userMock = UserInfo(id: 123,
                                name: "someone",
                                password: "123",
                                eMail: "someone@someone.ru",
                                bio: "123",
                                creditcard: "1234 5678 1234 1234",
                                gender: "m")
        let exp = XCTestExpectation(description: "Download https://failURL")
        let fileUrl = Bundle.main.url(forResource: "SimpleResult", withExtension: "json")!
        stub(condition: isMethodGET() &&
            pathEndsWith("login.json")) { _ in
                return OHHTTPStubsResponse(fileURL: fileUrl, statusCode: 200, headers: nil)
        }
        var user: ChangeUserDataResult?
        perInfFactory?.change(userInfo: userMock, completionHandler: {response in
            user = response.value
            exp.fulfill()
        })
        wait(for: [exp], timeout: 1.0)
        XCTAssertNil(user)
    }
}
