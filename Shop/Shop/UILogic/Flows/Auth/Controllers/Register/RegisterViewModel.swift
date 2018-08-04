import Foundation

class RegisterViewModel {
    var userInfo: UserInfo
    var registerService: AuthRequestsFactory
    
    init() {
        userInfo = UserInfo(id: 1, name: "", password: "", eMail: "", bio: "", creditcard: "", gender: "")
        registerService = GBShopServicesFactory.instance().makeAuthRequestFactory()
    }
    
    func register(login: String?, password: String?, completionHandler: @escaping ((_ error: Error?) -> Void)) {
        if let login = login,
            let password = password {
            userInfo.name = login
            userInfo.password = password
            registerService.register(user: userInfo, completionHandler: { dataResult in
                switch dataResult.result {
                case .success:
                    completionHandler(nil)
                case .failure:
                    completionHandler(Errors(type: .wrongRequest))
                }
            })
        } else {
            completionHandler(Errors(type: .wrongData))
        }
    }
}
