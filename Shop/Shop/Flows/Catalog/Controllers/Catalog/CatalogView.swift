protocol CatalogView: BaseView {
    var onItemSelected: ((GoodOnPageResult) -> Void)? {get set}
}
