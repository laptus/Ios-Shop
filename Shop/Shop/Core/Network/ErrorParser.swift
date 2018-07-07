import Foundation

class ErrorParser: AbstractErrorParser {
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
    
    func parse(_ result: Error) -> Error {
        return result
    }
}
