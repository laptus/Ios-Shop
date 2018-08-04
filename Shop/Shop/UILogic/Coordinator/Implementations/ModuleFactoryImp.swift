final class ModuleFactoryImp: AuthModuleFactory, CatalogModuleFactory, SettingsModuleFactory, BasketModuleFactory {
    func makeDetailItemView(for goodId: Int) -> DetailItemView {
        let view = DetailItemVC.controllerFromStoryboard(.catalog)
        view.service = DetailViewModel()
        view.goodId = goodId
        return view
    }
    
    
    func makeSettings() -> SettingsView {
        let view = UserDataVC.controllerFromStoryboard(.settings)
        view.viewModel = SettingsViewModel()
        return view
    }
    
    
    func makeAuth() -> AuthView {
        let view = AuthVC.controllerFromStoryboard(.auth)
        view.viewModel = AuthViewModel()
        return view
    }
    
    func makeItemsOutput() -> CatalogView {
        let view = CatalogTableVC.controllerFromStoryboard(.catalog)
        view.catalogViewModel = CatalogViewModel()
        return view
    }
    
    func makeSettings() -> UserDataVC {
        let view = UserDataVC.controllerFromStoryboard(.settings)
        view.viewModel = SettingsViewModel()
        return view
    }
    
    func makeBasket() -> BasketTableVC {
        return BasketTableVC.controllerFromStoryboard(.basket)
    }
}
