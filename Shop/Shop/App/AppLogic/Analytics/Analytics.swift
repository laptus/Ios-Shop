import Foundation
import Fabric
import Crashlytics

enum AnalyticsEvent {
    enum LoginMethod: String {
        case password
    }
    
    enum BasketMethods: String {
        case add
        case remove
        case get
        case buy
        case clear
    }
    
    enum CatalogMethods: String {
        case getCatalog
        case getGood
        case addReview
        case approveReview
        case removeReview
    }
    
    case login(method: LoginMethod, success: Bool)
    case register( success: Bool)
    case basket(moethod: BasketMethods, success: Bool)
    case userInfo(success: Bool)
    case logout
    case catalog(moethod: CatalogMethods, success: Bool)
}

protocol Analytics {
    func track(_ event: AnalyticsEvent)
}

extension Analytics {
    func track(_ event: AnalyticsEvent) {
        switch event {
        case let .login(method, success):
            let success = NSNumber(value: success)
            Answers.logLogin(withMethod: method.rawValue, success: success, customAttributes: nil)
        case let .basket(method, success):
            Answers.logCustomEvent(withName: method.rawValue, customAttributes: ["success": success])
        case let .userInfo(success):
            Answers.logCustomEvent(withName: "changeUserData", customAttributes: ["success": success])
        case .logout:
            Answers.logCustomEvent(withName: "logoUt")
        case let .catalog(method, success):
            Answers.logCustomEvent(withName: method.rawValue, customAttributes: ["success": success])
        case .register(let success):
            Answers.logCustomEvent(withName: "register", customAttributes: ["success": success])
        }
    }
}

func assertFailure(message: String,
                   _ event: AnalyticsEvent,
                   file: StaticString = #file,
                   line: UInt = #line) {
    
    #if DEBUG
    Swift.assertionFailure(message, file: file, line: line)
    #else
    Analytics.track(event)
    #endif
}
