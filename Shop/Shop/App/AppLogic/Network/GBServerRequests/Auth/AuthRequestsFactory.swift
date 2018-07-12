import Alamofire
import Foundation

protocol AuthRequestsFactory {
    func register(userInfo: UserInfo,
                  completionHandler: @escaping (DataResponse<RegisterResult>) -> Void)
    
    func login(username: String,
               password: String,
               completionHandler: @escaping(DataResponse<LoginResult>) -> Void)
    
    func logout(userId: String,
                completionHandler: @escaping(DataResponse<LogOutResult>) -> Void)
}
