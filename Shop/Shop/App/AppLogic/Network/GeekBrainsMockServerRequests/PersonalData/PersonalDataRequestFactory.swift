import Alamofire
import Foundation

protocol PersonalDataRequestFactory {
    func register(userInfo: IUserInfo,
                  completionHandler: @escaping (DataResponse<RegisterResult>) -> Void)
    
    func mutate(userInfo: IUserInfo,
                completionHandler: @escaping (DataResponse<MutatePersonalDataResult>) -> Void)
}
