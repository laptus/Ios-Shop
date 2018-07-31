class SettingsCoordinator: BaseCoordinator {
    let factory: SettingsModuleFactory
    let router: Router
    
    init(factory: SettingsModuleFactory, router: Router) {
        self.factory = factory
        self.router = router
    }
}
