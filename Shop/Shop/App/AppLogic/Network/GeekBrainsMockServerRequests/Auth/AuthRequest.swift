import Alamofire
import Foundation

class Auth: GenericRequest {
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

extension Auth: Authorizing {
    func register(userInfo: IUserInfo,
                  completionHandler: @escaping (DataResponse<RegisterResult>) -> Void) {
        let requestModel = RegistrationRouter(baseURL: baseUrl,
                                              userInfo: userInfo)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
    
    func login(username: String, password: String, completionHandler: @escaping (DataResponse<LoginResult>) -> Void) {
        let requestModel = Login(baseURL: baseUrl, login: username, password: password)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
    
    func logout(userId: String, completionHandler: @escaping (DataResponse<LogOutResult>) -> Void) {
        let requestModel = LogOut(baseURL: baseUrl, userId: userId)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
}


