import Alamofire
import OHHTTPStubs
@testable import Shop
import XCTest

class CatalogServiceTest: BaseServiceTest {
    
    var shopFactory: CatalogRequestsFactory?
    
    override func setUp() {
        super.setUp()
        let requestFactory = GBServicesFactoryMock()
        shopFactory = requestFactory.makeCatalogRequestsFactory()
    }
    
    override func tearDown() {
        super.tearDown()
        shopFactory = nil
    }
    
    func testGoodsOnPage() {
        let exp = XCTestExpectation(description: "Download https://failURL")
        
        httpStub(pathEnd: "GoodsOnPage.json")
        
        var goodsOnPage: [GoodOnPageResult]?
        shopFactory?.goods(page: 1, categoryId: 1, completionHandler: {response in
            goodsOnPage = response.value
            exp.fulfill()
        })
        
        wait(for: [exp], timeout: 1.0)
        XCTAssertNil(goodsOnPage)
        XCTAssert(goodsOnPage?.count == 2, "Wrong goods count")
    }
    
    func testGetGood() {
        let exp = XCTestExpectation(description: "Download https:/nonFailURL")
        
        httpStub(pathEnd: "getGoodById.json")
        
        var goodsOnPage: GetGoodResult?
        shopFactory?.good(goodId: 1, completionHandler: {response in
            goodsOnPage = response.value
            exp.fulfill()
        })
        
        wait(for: [exp], timeout: 1.0)
        XCTAssertNil(goodsOnPage)
    }
    
    func testAddReview() {
        let exp = XCTestExpectation(description: "Download https://nonFailURL")
        
        httpStub(pathEnd: "addReview.json")
        
        var goodsOnPage: AddReviewResult?
        shopFactory?.addReview(idUser: 1, text: "", completionHandler: {response in
            goodsOnPage = response.value
            exp.fulfill()
        })
        
        wait(for: [exp], timeout: 1.0)
        XCTAssertNil(goodsOnPage)
    }
    
    func testApproveReview() {
        let exp = XCTestExpectation(description: "Download https://nonFailURL")
        
        httpStub(pathEnd: "approveReview")
        
        var goodsOnPage: ApproveReviewResult?
        shopFactory?.approveReview(idComment: 1, completionHandler: {response in
            goodsOnPage = response.value
            exp.fulfill()
        })
        
        wait(for: [exp], timeout: 1.0)
        XCTAssertNil(goodsOnPage)
    }
    
    func testRemoveReview() {
        let exp = XCTestExpectation(description: "Download https://nonFailURL")
        
        httpStub(pathEnd: "removeReview.json")
        
        var goodsOnPage: RemoveReviewResult?
        shopFactory?.removeReview(idComment: 1, completionHandler: {response in
            goodsOnPage = response.value
            exp.fulfill()
        })
        
        wait(for: [exp], timeout: 1.0)
        XCTAssertNil(goodsOnPage)
    }
}
