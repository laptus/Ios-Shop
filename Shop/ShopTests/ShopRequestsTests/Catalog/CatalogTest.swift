import Alamofire
import OHHTTPStubs
@testable import Shop
import XCTest

class ShopRequestsTest: XCTestCase {
    var errorParser: ErrorParserStub!
    
    var shopFactory: CatalogRequestsFactory?
    
    override func setUp() {
        super.setUp()
        let requestFactory = GeekBrainsRequestFactoryMock()
        shopFactory = requestFactory.makeCatalogRequestsFactory()
    }
    
    override func tearDown() {
        super.tearDown()
        shopFactory = nil
        OHHTTPStubs.removeAllStubs()
    }
    
    func testGoodsOnPageChange() {
        let exp = XCTestExpectation(description: "Download https://failURL")
        let fileUrl = Bundle.main.url(forResource: "GoodsOnPage", withExtension: "json")!
        stub(condition: isMethodGET() &&
            pathEndsWith("login.json")) { _ in
                return OHHTTPStubsResponse(fileURL: fileUrl, statusCode: 200, headers: nil)
        }
        var goodsOnPage: GoodsOnPageResult?
        shopFactory?.goods(page: 1, categoryId: 1, completionHandler:{response in
            goodsOnPage = response.value
            exp.fulfill()
        })
        wait(for: [exp], timeout: 1.0)
        XCTAssertNil(goodsOnPage)
        XCTAssert(goodsOnPage?.goods.count == 2, "Wrong goods count")
    }
}
