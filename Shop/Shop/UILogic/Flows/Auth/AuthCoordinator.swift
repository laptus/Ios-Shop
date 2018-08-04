final class AuthCoordinator: BaseCoordinator, AuthCoordinatorOutput {
    var finishFlow: (() -> Void)?
    
    private let factory: AuthModuleFactory
    private let router: Router
    
    init(router: Router, factory: AuthModuleFactory) {
        self.factory = factory
        self.router = router
    }
    
    override func start() {
        showLogin()
    }
    
    private func showLogin() {
        let auth = factory.makeAuth()
        auth.onCompleteAuth = { [weak self] in
            self?.finishFlow?()
        }
        
        router.setRootModule(auth)
    }
}
