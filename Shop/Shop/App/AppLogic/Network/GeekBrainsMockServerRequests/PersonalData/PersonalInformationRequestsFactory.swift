import Alamofire
import Foundation

protocol PersonalInformationRequestsFactory {
    
    func change(userInfo: IUserInfo,
                completionHandler: @escaping (DataResponse<ChangePersonInfoResult>) -> Void)
}
