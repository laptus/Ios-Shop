class SettingsCoordinator: BaseCoordinator {
    let factory: SettingsModuleFactory
    let router: Router
    
    init(factory: SettingsModuleFactory, router: Router) {
        self.factory = factory
        self.router = router
    }
    
    override func start() {
        let view = factory.makeSettings()
        router.push(view)
    }
}
