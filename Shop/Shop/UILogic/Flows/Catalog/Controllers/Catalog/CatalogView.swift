protocol CatalogView: BaseView {
    var onItemSelected: ((Int) -> Void)? { get set }
}
