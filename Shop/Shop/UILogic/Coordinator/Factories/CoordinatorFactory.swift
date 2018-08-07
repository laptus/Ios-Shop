import UIKit

protocol CoordinatorFactory {
    
    func makeTabbarCoordinator() -> (configurator: TabBarCoordinator, toPresent: Presentable?)
    
    func makeAuthCoordinatorBox(router: Router) -> Coordinator & AuthCoordinatorOutput
    
    func makeCatalogCoordinator(navController: UINavigationController?) -> Coordinator
    
    func makeItemCoordinator(navController: UINavigationController) -> Coordinator
    
    func makeSettingsCoordinator(navController: UINavigationController?) -> Coordinator
    
    func makeBasketCoordinator(navController: UINavigationController?) -> Coordinator
}
