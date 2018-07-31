protocol CatalogModuleFactory {
    func makeItemsOutput() -> CatalogView
    func makeDetailItemView() -> DetailItemView
}
