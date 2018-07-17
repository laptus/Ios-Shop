import Alamofire
import Foundation

extension AuthService {
    struct RegistrationRouter: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = "registerUser.json"
        var parameters: Parameters? {
            return ["id_user": userInfo.id,
                    "username": userInfo.name,
                    "password": userInfo.password,
                    "email": userInfo.eMail,
                    "gender": userInfo.gender,
                    "credit_card": userInfo.creditcard,
                    "bio": userInfo.bio]
        }
        
        let userInfo: UserInfo
    }
    
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
        
        let userId: Int
    }
}
