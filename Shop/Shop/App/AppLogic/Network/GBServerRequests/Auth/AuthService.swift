import Alamofire
import Foundation

class AuthService: GBShopSessionManager {
}

/// gb shop auth service
extension AuthService: AuthRequestsFactory {
    
    func register(user: UserInfo,
                  completionHandler: @escaping RequestVoidCompletion<RegisterResult>) {
        
        let requestModel = RegistrationRouter(baseURL: baseUrl,
                                              userInfo: user)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
    
    func login(username: String,
               password: String,
               completionHandler: @escaping RequestVoidCompletion<LoginResult>) {
        
        let requestModel = Login(baseURL: baseUrl, login: username, password: password)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
    
    func logout(userId: Int,
                completionHandler: @escaping RequestVoidCompletion<LogOutResult>) {
        
        let requestModel = LogOut(baseURL: baseUrl, userId: userId)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
}
