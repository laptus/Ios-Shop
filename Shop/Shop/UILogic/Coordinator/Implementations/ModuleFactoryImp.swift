final class ModuleFactoryImp: AuthModuleFactory, CatalogModuleFactory, SettingsModuleFactory, BasketModuleFactory {
    func makeDetailItemView(for goodId: Int) -> DetailItemView {
        let view = DetailItemVC.controllerFromStoryboard(.catalog)
        view.goodId = goodId
        return view
    }
    
    
    func makeSettings() -> SettingsView {
        return UserDataVC.controllerFromStoryboard(.settings)
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
    
    func makeBasket() -> BasketTableVC {
        return BasketTableVC.controllerFromStoryboard(.basket)
    }
}
