final class ModuleFactoryImp: AuthModuleFactory, CatalogModuleFactory, SettingsModuleFactory {
    func makeDetailItemView() -> DetailItemView {
        return DetailItemVC.controllerFromStoryboard(.auth)
    }
    
    
    func makeSettings() -> User {
        return User(id: 1, login: "", name: "", lastname: "")
    }
    
    
    func makeAuth() -> AuthView {
        return AuthVC.controllerFromStoryboard(.auth)
    }
    
    func makeItemsOutput() -> CatalogView {
        return CatalogTableVC.controllerFromStoryboard(.catalog)
    }
    
    func makeSettings() -> UserDataVC {
        return UserDataVC.controllerFromStoryboard(.settings)
    }
}
