import Alamofire
import Foundation

protocol UserDataRequestsFactory {
    
    func change(userInfo: UserInfo,
                completionHandler: @escaping RequestVoidCompletion<ChangeUserDataResult>)
}
