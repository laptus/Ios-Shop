import Alamofire
import Foundation

class Auth: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: SessionManager
    let queue: DispatchQueue?
    let baseUrl: URL
    
    init(errorParser: AbstractErrorParser,
         sessionManager: SessionManager,
         queue: DispatchQueue? = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
        baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    }
}

extension Auth: AuthRequestFactory {
    func login(username: String, password: String, completionHandler: @escaping (DataResponse<LoginResult>) -> Void) {
        let requestModel = Login(baseURL: baseUrl, login: username, password: password)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
    
    func logout(userId: String, completionHandler: @escaping (DataResponse<LogOutResult>) -> Void) {
        let requestModel = LogOut(baseURL: baseUrl, userId: userId)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
}

extension Auth {
    struct Login: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = "login.json"
        var parameters: Parameters? {
            return ["username": login,
                    "password": password]
        }
        
        let login: String
        let password: String
    }
    
    struct LogOut: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = "logout.json"
        var parameters: Parameters? {
            return ["id_user": userId]
        }
        
        let userId: String
    }
}
