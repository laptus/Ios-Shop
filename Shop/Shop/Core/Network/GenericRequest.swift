import Alamofire
import Foundation


/// generic request fabric
protocol GenericRequest {
    
    var errorParser: AbstractErrorParser { get }
    var sessionManager: SessionManager { get }
    var queue: DispatchQueue? { get }
    
    @discardableResult
    func request<T: Decodable>(reques: URLRequestConvertible,
                               completionHandler: @escaping(DataResponse<T>) -> Void) -> DataRequest
}

extension GenericRequest {
    
    @discardableResult
    func request<T: Decodable>(reques: URLRequestConvertible,
                               completionHandler: @escaping(DataResponse<T>) -> Void) -> DataRequest {
        return sessionManager
            .request(reques)
            .responseCodable(errorParser: errorParser, qeue: queue, completionHandler: completionHandler)
    }
}
