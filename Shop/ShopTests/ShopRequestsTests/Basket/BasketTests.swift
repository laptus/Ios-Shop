import Alamofire
import OHHTTPStubs
@testable import Shop
import XCTest

class BaksetServiceTest: BaseServiceTest {
    
    var basketService: BasketRequestsFactory?
    
    override func setUp() {
        super.setUp()
        let requestFactory = GBServicesFactoryMock()
        basketService = requestFactory.makeBasketRequestsFactory()
    }
    
    override func tearDown() {
        super.tearDown()
        basketService = nil
    }
    
    func testAdd() {
        let exp = XCTestExpectation(description: "Download https://nonfailURL")
        
        httpStub(pathEnd: "addToBasket.json")
        
        var result: AddToBasketResult?
        basketService?.add(idProduct: 1, quantity: 1, completionHandler: {response in
                result = response.value
                exp.fulfill()
            })
        wait(for: [exp], timeout: 1.0)
        XCTAssertNil(result)
    }
    
    func testDelete() {
        let exp = XCTestExpectation(description: "Download https://nonfailURL")
        
        httpStub(pathEnd: "deleteFromBasket.json")
        
        var result: RemoveFromBasketResult?
        basketService?.delete(idProduct: 1, completionHandler: {response in
            result = response.value
            exp.fulfill()
        })
        
        wait(for: [exp], timeout: 1.0)
        XCTAssertNil(result)
    }
    
    func testGetContents() {
        let exp = XCTestExpectation(description: "Download https://nonfailURL")
        
        httpStub(pathEnd: "getBasket.json")
        
        var result: GetContentsResult?
        basketService?.getContents(idUser: 1, completionHandler: {response in
            result = response.value
            exp.fulfill()
        })
        
        wait(for: [exp], timeout: 1.0)
        XCTAssertNil(result)
    }
}
