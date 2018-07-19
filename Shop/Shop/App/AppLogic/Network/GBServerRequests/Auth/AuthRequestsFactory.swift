import Alamofire
import Foundation

protocol AuthRequestsFactory {
    
    func register(user: UserInfo,
                  completionHandler: @escaping RequestVoidCompletion<RegisterResult>)
    
    func login(username: String,
               password: String,
               completionHandler: @escaping RequestVoidCompletion<LoginResult>)
    
    func logout(userId: Int,
                completionHandler: @escaping RequestVoidCompletion<LogOutResult>)
}
