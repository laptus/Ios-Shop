import Foundation

struct Errors: LocalizedError {
    var title: String = ""
    var code: Int = 404
    var type: ErrorTypes
    var errorDescription: String? { return "" }
    var failureReason: String? { return "" }
    
    init(type: ErrorTypes) {
        self.type = type
    }
}
