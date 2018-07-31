protocol AuthView: BaseView {
    var onCompleteAuth: (() -> Void)? { get set }
}
