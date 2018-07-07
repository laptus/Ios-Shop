import Alamofire
import Foundation

protocol AuthRequestFactory {
    func login(username: String,
               password: String,
               completionHandler: @escaping(DataResponse<LoginResult>) -> Void)
}
