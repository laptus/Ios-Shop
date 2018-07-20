import Alamofire
import Foundation

class UserDataService: GBShopSessionManager {
}

/// gb shop user data service
extension UserDataService: UserDataRequestsFactory {
        
    func change(userInfo: UserInfo,
                completionHandler: @escaping RequestVoidCompletion<ChangeUserDataResult>) {
        
        let requestModel = RegistrationRouter(baseURL: baseUrl,
                                              userInfo: userInfo)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
}
