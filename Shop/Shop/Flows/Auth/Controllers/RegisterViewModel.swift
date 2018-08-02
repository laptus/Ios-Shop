class RegisterViewModel {
    var userInfo: UserInfo?
    var registerService: AuthRequestsFactory
    
    init() {
        userInfo = UserInfo(id: 1, name: "", password: "", eMail: "", bio: "", creditcard: "", gender: "")
        registerService = GBShopServicesFactory.instance().makeAuthRequestFactory()
    }
}
