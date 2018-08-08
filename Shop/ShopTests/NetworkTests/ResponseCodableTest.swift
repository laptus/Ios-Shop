import Alamofire
@testable import Shop
import XCTest

struct PostStub: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class ResponseCodableTest: XCTestCase {
    var errorParser: ErrorParserStub!
    
    override func setUp() {
        super.setUp()
        errorParser = ErrorParserStub()
    }
    
    override func tearDown() {
        super.tearDown()
        errorParser = nil
    }
    
    func testShouldFailWrongURL() {
        let exp = XCTestExpectation(description: "Download https://failURL")
        
        Alamofire.request("https://failURL")
            .responseCodable(errorParser: errorParser) {(response: DataResponse<PostStub>) in
                switch response.result {
                case .success:
                    break
                case .failure:
                    XCTFail("123")
                }
                exp.fulfill()
            }
        wait(for: [exp], timeout: 1.0)
    }
    
    func testShouldLoadAndPArse() {
        let exp = XCTestExpectation(description: "")
        var post: PostStub?
        Alamofire.request("https://failURL")
            .responseCodable(errorParser: errorParser) {(response: DataResponse<PostStub>) in
                post = response.value
                exp.fulfill()
            }
        wait(for: [exp], timeout: 1.0)
    }
}
