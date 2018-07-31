protocol RegisterView: BaseView {
    var onCompleteRegister: (() -> Void)? { get set }
}
