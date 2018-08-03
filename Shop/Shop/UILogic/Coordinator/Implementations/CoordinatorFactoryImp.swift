import UIKit

class CoordinatorFactoryImp: CoordinatorFactory {
    
    func makeItemCoordinator(navController: UINavigationController) -> Coordinator {
        let coordinator = CatalogCoordinator(catalogFactory: ModuleFactoryImp(),
                                             router: router(navController),
                                             coordinatorFactory: CoordinatorFactoryImp())
        return coordinator
    }
    
    func makeAuthCoordinatorBox(router: Router) -> AuthCoordinatorOutput & Coordinator {
        let controller = AuthCoordinator(router: router,
                                          factory: ModuleFactoryImp())
        return controller
    }
    
    func makeTabbarCoordinator() -> (configurator: Coordinator, toPresent: Presentable?) {
        let controller = TabbarVC.controllerFromStoryboard(.tabBar)
        let coordinator = TabBarCoordinator(tabbarView: controller,
                                            coordinatorFactory: CoordinatorFactoryImp())
        return (coordinator, controller)
    }
    
    func makeCatalogCoordinator(navController: UINavigationController? = nil) -> Coordinator {
        let coordinator = CatalogCoordinator(catalogFactory: ModuleFactoryImp(),
                                             router: router(navController),
                                             coordinatorFactory: CoordinatorFactoryImp())
        return coordinator
    }
    
    func makeBasketCoordinator(navController: UINavigationController? = nil) -> Coordinator {
        let coordinator = BasketCoordinator(catalogFactory: ModuleFactoryImp(),
                                             router: router(navController),
                                             coordinatorFactory: CoordinatorFactoryImp())
        return coordinator
    }
    
    func makeSettingsCoordinator(navController: UINavigationController?) -> Coordinator {
        let coordinator = SettingsCoordinator(factory: ModuleFactoryImp(),
                                              router: router(navController))
        return coordinator
    }
    
    private func router(_ navController: UINavigationController?) -> Router {
        return RouterImp(rootController: navigationController(navController))
    }
    
    private func navigationController(_ navController: UINavigationController?) -> UINavigationController {
        if let navController = navController {
            return navController
        }
        else {
        return UINavigationController.controllerFromStoryboard(.main)
        }
    }
}
