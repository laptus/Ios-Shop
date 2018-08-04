import Foundation

private var isAuthorized: Bool = false

final class AppCoordinator: BaseCoordinator {
    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    
    init(router: Router, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        if isAuthorized {
            runMainFlow()
        } else {
            runAuthFlow()
        }
    }
    
    private func runMainFlow() {
        let (coordinator, module) = coordinatorFactory.makeTabbarCoordinator()
        coordinator.onLogOutAuth = {[weak self] in
            isAuthorized = false
            self?.router.dismissModule()
            self?.removeDependency(coordinator)
            self?.start()
            
        }
        addDependency(coordinator)
        router.setRootModule(module)
        coordinator.start()
    }
    
    private func runAuthFlow() {
        let coordinator = coordinatorFactory.makeAuthCoordinatorBox(router: router)
        coordinator.finishFlow = {[weak self] in
            isAuthorized = true
            self?.router.dismissModule()
            self?.removeDependency(coordinator)
            self?.start()
            
        }
        
        addDependency(coordinator)
        coordinator.start()
    }
    
    deinit {
        
    }
}
