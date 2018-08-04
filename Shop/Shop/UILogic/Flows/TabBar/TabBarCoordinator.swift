import UIKit

class TabBarCoordinator: BaseCoordinator {
    private let tabbarView: TabBarView
    private let coordinatorFactory: CoordinatorFactory
    
    init(tabbarView: TabBarView, coordinatorFactory: CoordinatorFactory) {
        self.tabbarView = tabbarView
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        tabbarView.onViewDidLoad = runCatalogFlow()
        tabbarView.onItemFlowSelect = runItemFlow()
        tabbarView.onSettingsFlowSelect = runSettingsFlow()
         tabbarView.onBasketFlowSelect = runBasketFlow()
    }
    
    private func runCatalogFlow() -> ((UINavigationController) -> Void) {
        return { navController in
            if navController.viewControllers.isEmpty == true {
                let catalogCoordinator = self.coordinatorFactory.makeCatalogCoordinator(navController: navController)
                catalogCoordinator.start()
                self.addDependency(catalogCoordinator)
            }
        }
    }
    
    private func runSettingsFlow() -> ((UINavigationController) -> Void) {
        return { navController in
            if navController.viewControllers.isEmpty == true {
                let settingsCoordinator = self.coordinatorFactory.makeSettingsCoordinator(navController: navController)
                settingsCoordinator.start()
                self.addDependency(settingsCoordinator)
            }
        }
    }
    
    private func runItemFlow() -> ((UINavigationController) -> Void) {
        return { navController in
            if navController.viewControllers.isEmpty == true {
                let catalogCoordinator = self.coordinatorFactory.makeItemCoordinator(navController: navController)
                catalogCoordinator.start()
                self.addDependency(catalogCoordinator)
            }
        }
    }
    
    private func runBasketFlow() -> ((UINavigationController) -> Void) {
        return { navController in
            if navController.viewControllers.isEmpty == true {
                let basketCoordinator = self.coordinatorFactory.makeBasketCoordinator(navController: navController)
                basketCoordinator.start()
                self.addDependency(basketCoordinator)
            }
        }
    }
}
