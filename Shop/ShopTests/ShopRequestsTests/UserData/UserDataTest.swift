import Alamofire
import OHHTTPStubs
@testable import Shop
import XCTest

class UserDataServiceTest: BaseServiceTest {
    
    let userMock = UserInfo(id: 123,
                            name: "someone",
                            password: "123",
                            eMail: "someone@someone.ru",
                            bio: "123",
                            creditcard: "1234 5678 1234 1234",
                            gender: "m")
    var usrDataRequestFactory: UserDataRequestsFactory?
    
    override func setUp() {
        super.setUp()
        
        let requestFactory = GBServicesFactoryMock()
        usrDataRequestFactory = requestFactory.makePersonalDataRequestFactory()
    }
    
    override func tearDown() {
        super.tearDown()
        usrDataRequestFactory = nil
    }
    
    func testPersInfChange() {
        let exp = XCTestExpectation(description: "Download https://failURL")
        
        httpStub(pathEnd: "changeUserData.json")
        
        var user: ChangeUserDataResult?
        usrDataRequestFactory?.change(userInfo: userMock, completionHandler: {response in
            user = response.value
            exp.fulfill()
        })
        
        wait(for: [exp], timeout: 1.0)
        XCTAssertNotNil(user)
    }
}
