import Alamofire
import Foundation

extension DataRequest {
    @discardableResult
    func responseCodable<T: Decodable>( errorParser: AbstractErrorParser,
                                        qeue: DispatchQueue? = nil,
                                        completionHandler: @escaping(DataResponse<T>) -> Void) -> Self {
        let responseSerializer = DataResponseSerializer<T>(serializeResponse: { request, response, data, error in
            if let error = errorParser.parse(response: response, data: data, error: error) {
                return .failure(error)
            }
            let result = Request.serializeResponseData(response: response, data: data, error: error)
            switch result {
            case .success(let data):
                do {
                    let value = try JSONDecoder().decode(T.self, from: data)
                    return .success(value)
                } catch {
                    let customError = errorParser.parse(error)
                    return .failure(customError)
                }
            case .failure(let error):
                let customError = errorParser.parse(error)
                return .failure(customError)
            }
        })
        return response(queue: qeue, responseSerializer: responseSerializer, completionHandler: completionHandler)
    }
}
