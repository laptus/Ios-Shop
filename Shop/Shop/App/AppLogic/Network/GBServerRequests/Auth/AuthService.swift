import Alamofire
import Foundation

class Auth: GenericRequest {
    var errorParser: AbstractErrorParser
    var sessionManager: SessionManager
    var queue: DispatchQueue?
    let baseUrl: URL = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(errorParser: AbstractErrorParser,
         sessionManager: SessionManager,
         queue: DispatchQueue? = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension Auth: AuthRequestsFactory {
    func register(userInfo: UserInfo,
                  completionHandler: @escaping (DataResponse<RegisterResult>) -> Void) {
        let requestModel = RegistrationRouter(baseURL: baseUrl,
                                              userInfo: userInfo)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
    
    func login(username: String, password: String, completionHandler: @escaping (DataResponse<LoginResult>) -> Void) {
        let requestModel = Login(baseURL: baseUrl, login: username, password: password)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
    
    func logout(userId: Int, completionHandler: @escaping (DataResponse<LogOutResult>) -> Void) {
        let requestModel = LogOut(baseURL: baseUrl, userId: userId)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
}
