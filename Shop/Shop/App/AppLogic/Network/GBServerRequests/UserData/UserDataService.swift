import Alamofire
import Foundation

class UserDataService: GBShopRequestConfig {
}

extension UserDataService: UserDataRequestsFactory {
        
    func change(userInfo: UserInfo,
                completionHandler: @escaping (DataResponse<ChangePersonInfoResult>) -> Void) {
        let requestModel = RegistrationRouter(baseURL: baseUrl,
                                              userInfo: userInfo)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
}
