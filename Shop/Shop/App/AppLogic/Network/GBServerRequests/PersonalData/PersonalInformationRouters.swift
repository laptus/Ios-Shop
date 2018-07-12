import Alamofire
import Foundation

extension PersonalInformationRequests {
    struct RegistrationRouter: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = "changeUserData.json"
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
}
