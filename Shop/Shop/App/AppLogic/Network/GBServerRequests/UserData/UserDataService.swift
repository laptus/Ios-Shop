import Alamofire
import Foundation

class UserDataService: GBShopSessionManager {
}

extension UserDataService: UserDataRequestsFactory {
        
    func change(userInfo: UserInfo,
                completionHandler: @escaping (DataResponse<ChangeUserDataResult>) -> Void) {
        let requestModel = RegistrationRouter(baseURL: baseUrl,
                                              userInfo: userInfo)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
}
