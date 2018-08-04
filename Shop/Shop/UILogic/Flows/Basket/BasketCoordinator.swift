class BasketCoordinator: BaseCoordinator {
    private let factory: BasketModuleFactory
    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    
    init(catalogFactory: BasketModuleFactory, router: Router, coordinatorFactory: CoordinatorFactory) {
        self.factory = catalogFactory
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        showBasket()
    }
    
    func showBasket() {
        let itemsView = factory.makeBasket()
        router.push(itemsView)
    }
}
