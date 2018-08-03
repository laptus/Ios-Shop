protocol CatalogModuleFactory {
    func makeItemsOutput() -> CatalogView
    func makeDetailItemView(for goodId: Int) -> DetailItemView
}
