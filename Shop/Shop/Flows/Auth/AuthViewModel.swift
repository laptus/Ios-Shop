import Foundation

class AuthViewModel {
    var authService: AuthRequestsFactory
    
    init() {
        authService = GBShopServicesFactory().makeAuthRequestFactory()
    }
    
    func login(userName: String,
               password: String,
               completionHandler: @escaping((_ error: Error?) -> Void)) {
        authService.login(username: userName, password: password, completionHandler: { dataResult in
            switch dataResult.result {
            case .success:
                completionHandler(nil)
            case .failure(let error):
                completionHandler(error)
            }
        })
    }
    
    func register(userInfo: UserInfo,
                  completionHandler: @escaping((_ error: Error?) -> Void)) {
        authService.register(user: userInfo, completionHandler: { dataResult in
            switch dataResult.result {
            case .success:
                completionHandler(nil)
            case .failure(let error):
                completionHandler(error)
            }
        })
    }
}
