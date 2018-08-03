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
        showCatalog()        
    }
    
    func showCatalog(){
        let itemsView = factory.makeItemsOutput()
        itemsView.onItemSelected = { [weak self] goodId in
            self?.showItemDetails(for: goodId)
        }
        router.push(itemsView)
    }
    
    func showItemDetails(for goodId: Int) {
        let detailView = factory.makeDetailItemView(for: goodId)
        router.push(detailView)
    }
}
