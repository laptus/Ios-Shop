import Alamofire
import Foundation

class PersonalDataRequest: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: SessionManager
    let queue: DispatchQueue?
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(errorParser: AbstractErrorParser,
         sessionManager: SessionManager,
         queue: DispatchQueue? = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension PersonalDataRequest: PersonalDataRequestFactory {
    func register(userInfo: IUserInfo,
                  completionHandler: @escaping (DataResponse<RegisterResult>) -> Void) {
        let requestModel = RegistrationRouter(baseURL: baseUrl,
                                              userInfo: userInfo)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
    
    func mutate(userInfo: IUserInfo,
                completionHandler: @escaping (DataResponse<MutatePersonalDataResult>) -> Void) {
        let requestModel = RegistrationRouter(baseURL: baseUrl,
                                              userInfo: userInfo)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
}

extension PersonalDataRequest {
    struct RegistrationRouter: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = "login.json"
        var parameters: Parameters? {
            return ["id_user": userInfo.id,
                "username": userInfo.name,
                "password": userInfo.password,
                "email": userInfo.eMail,
                "gender": userInfo.gender,
                "credit_card": userInfo.creditcard,
                "bio": userInfo.bio]
        }
        
        let userInfo: IUserInfo
    }
}
