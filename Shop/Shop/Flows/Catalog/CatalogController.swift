class CatalogCoordinator: BaseCoordinator {
    private let factory: CatalogModuleFactory
    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    
    init(catalogFactory: CatalogModuleFactory, router: Router, coordinatorFactory: CoordinatorFactory) {
        self.factory = catalogFactory
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        
        
    }
    
    func showCatalog(){
        let itemsView = factory.makeItemsOutput()
        itemsView.onItemSelected = { [weak self] (item) in
            self?.showItemDetails(item)
        }
        router.setRootModule(itemsView)
    }
    
    func showItemDetails(_ item: GoodOnPageResult) {
    }
}
