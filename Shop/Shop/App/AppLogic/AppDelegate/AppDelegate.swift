import Crashlytics
import Fabric
import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var requestFactory: GBShopServicesFactory
    var rootController: UINavigationController {
        return self.window!.rootViewController as! UINavigationController
    }
    
    private lazy var applicationCoordinator: Coordinator = self.makeCoordinator()
        
    override init() {
        requestFactory = GBShopServicesFactory.instance()
        super.init()
    }
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        Fabric.with([Crashlytics.self])
        applicationCoordinator.start()
        return true
    }

    private func makeCoordinator() -> Coordinator {
        return AppCoordinator(
            router: RouterImp(rootController: self.rootController),
            coordinatorFactory: CoordinatorFactoryImp()
        )
    }
}
