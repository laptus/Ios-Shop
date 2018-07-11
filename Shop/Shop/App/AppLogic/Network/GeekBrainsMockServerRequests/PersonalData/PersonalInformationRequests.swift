import Alamofire
import Foundation

class PersonalInformationRequests: GenericRequest {
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

extension PersonalInformationRequests: PersonalInformationRequestsFactory {
        
    func change(userInfo: UserInfo,
                completionHandler: @escaping (DataResponse<ChangePersonInfoResult>) -> Void) {
        let requestModel = RegistrationRouter(baseURL: baseUrl,
                                              userInfo: userInfo)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
}
