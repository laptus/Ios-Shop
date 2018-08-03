class SettingsViewModel {
    var userInfo: UserInfo
    var service: UserDataRequestsFactory
    
    init(userInfo: UserInfo, service: UserDataRequestsFactory) {
        self.userInfo = userInfo
        self.service = service
    }
    
    func changeInfo() {
        
    }
}
