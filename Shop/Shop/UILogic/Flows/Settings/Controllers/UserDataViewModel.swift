class SettingsViewModel {
    var user: UserInfo?
    var userInfoService: UserDataRequestsFactory?
    var authService: AuthRequestsFactory?
    
    init() {
        userInfoService = GBShopServicesFactory.instance().makePersonalDataRequestFactory()
        authService = GBShopServicesFactory.instance().makeAuthRequestFactory()
    }
    
    func changeInfo(userInfo: UserInfo, completionHandler: @escaping (Errors?, Bool) -> Void) {
        userInfoService?.change(userInfo: userInfo, completionHandler: {response in
            switch response.result {
            case .failure(_):
                completionHandler(Errors(type: .wrongRequest), false)
            case .success(_):
                completionHandler(nil, true)
            }
        })
    }
    
    func logOut(id: Int, completionHandler: @escaping (() -> Void) ) {
        authService?.logout(userId: id, completionHandler: {response in
            switch response.result{
            case .success(_):
                completionHandler()
            case .failure(_):
                return
            }
        })
    }
}
