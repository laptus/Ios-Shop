import Alamofire
import Foundation

protocol Authorizing {
    func register(userInfo: IUserInfo,
                  completionHandler: @escaping (DataResponse<RegisterResult>) -> Void)
    
    func login(username: String,
               password: String,
               completionHandler: @escaping(DataResponse<LoginResult>) -> Void)
    
    func logout(userId: String,
                completionHandler: @escaping(DataResponse<LogOutResult>) -> Void)
}
