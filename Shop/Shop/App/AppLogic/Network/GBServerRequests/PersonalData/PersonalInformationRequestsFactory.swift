import Alamofire
import Foundation

protocol PersonalInformationRequestsFactory {
    
    func change(userInfo: UserInfo,
                completionHandler: @escaping (DataResponse<ChangePersonInfoResult>) -> Void)
}
