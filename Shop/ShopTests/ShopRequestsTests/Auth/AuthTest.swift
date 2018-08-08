import Alamofire
import OHHTTPStubs
@testable import Shop
import XCTest

class AuthSerivceTest: BaseServiceTest {
    
    var authFactory: AuthRequestsFactory?
    
    override func setUp() {
        super.setUp()
        let requestFactory = GBServicesFactoryMock()
        authFactory = requestFactory.makeAuthRequestFactory()
    }
    
    override func tearDown() {
        super.tearDown()
        authFactory = nil
    }
    
    func testAuthLogin() {
        let exp = XCTestExpectation(description: "Download https://failURL")
        httpStub(pathEnd: "loginStub.json")
        
        var user: LoginResult?
        authFactory?.login(username: "someone", password: "password", completionHandler: {response in
            user = response.value
             exp.fulfill()
        })
        wait(for: [exp], timeout: 2.0)
        XCTAssertNotNil(user)
    }
    
    func testAuthLogOut() {
        let exp = XCTestExpectation(description: "Download https://failURL")
        
        httpStub(pathEnd: "logout.json")
        
        var user: LogOutResult?
        authFactory?.logout(userId: 1, completionHandler: {response in
            user = response.value
            exp.fulfill()
        })
        
        wait(for: [exp], timeout: 1.0)
        XCTAssertNotNil(user)
    }
    
    func testAuthRegister() {
        let userMock = UserInfo(id: 123,
                                name: "someone",
                                password: "123",
                                eMail: "someone@someone.ru",
                                bio: "123",
                                creditcard: "1234 5678 1234 1234",
                                gender: "m")
        
        let exp = XCTestExpectation(description: "Download https://failURL")
        
        httpStub(pathEnd: "registerUser.json")
        
        var user: RegisterResult?
        authFactory?.register(user: userMock, completionHandler: {response in
            user = response.value
            exp.fulfill()
        })
        
        wait(for: [exp], timeout: 1.0)
        XCTAssertNotNil(user)
    }
}
