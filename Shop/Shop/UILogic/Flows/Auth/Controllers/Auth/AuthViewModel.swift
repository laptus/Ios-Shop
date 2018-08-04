import Foundation

class AuthViewModel: Analytics {
    var authService: AuthRequestsFactory
    
    init() {
        authService = GBShopServicesFactory.instance().makeAuthRequestFactory()
    }
    
    func login(userName: String,
               password: String,
               completionHandler: @escaping((_ error: Error?) -> Void)) {
        authService.login(username: userName, password: password, completionHandler: {[weak self] dataResult in
            switch dataResult.result {
            case .success:
                let userResult = (dataResult.value as! LoginResult).user
                let info = UserInfo(id: userResult.id,
                                    name: userResult.name,
                                    password: password,
                                    eMail: "",
                                    bio: "",
                                    creditcard: "",
                                    gender: "")
                completionHandler(nil)
                self?.track(AnalyticsEvent.login(method: AnalyticsEvent.LoginMethod.password, success: true))
            case .failure(let error):
                completionHandler(error)
                self?.track(AnalyticsEvent.login(method: AnalyticsEvent.LoginMethod.password, success: false))
            }
        })
    }
    
    func register(userInfo: UserInfo,
                  completionHandler: @escaping((_ error: Error?) -> Void)) {
        authService.register(user: userInfo, completionHandler: { [weak self] dataResult in
            switch dataResult.result {
            case .success:
                completionHandler(nil)
                self?.track(AnalyticsEvent.register(success: true))
            case .failure(let error):
                completionHandler(error)
                self?.track(AnalyticsEvent.register(success: false))
            }
        })
    }
}
