import Alamofire
import Foundation

protocol AuthRequestFactory {
    func login(username: String,
               password: String,
               completionHandler: @escaping(DataResponse<LoginResult>) -> Void)
    
    func logout(userId: String,
                completionHandler: @escaping(DataResponse<LogOutResult>) -> Void)
}
