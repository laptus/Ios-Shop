@testable import Shop
import Alamofire
import XCTest

struct PostStub: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

enum ApiErrorStub: Error {
    case fatalError
}

struct ErrorParserStub: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return ApiErrorStub.fatalError
    }
    
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}

class ResponseCodable: XCTestCase {
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
            .responseCodable(errorParser: errorParser){ [weak self] (response: DataResponse<PostStub>) in
                switch response.result {
                case .success( _ ):
                    break
                case .failure( _ ):
                    XCTFail()
                }
                exp.fulfill()
        }
        wait(for: [exp], timeout: 10.0)
    }
    
    func testShouldLoadAndPArse() {
        let exp = XCTestExpectation(description: "")
        var post:  PostStub?
        Alamofire.request("https://failURL")
            .responseCodable(errorParser: errorParser){ [weak self] (response: DataResponse<PostStub>) in
                post = response.value
                exp.fulfill()
        }
        wait(for: [exp], timeout: 10.0)
        XCTAssertNil(post)
    }
}

