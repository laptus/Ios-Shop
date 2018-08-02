protocol SettingsView: BaseView {
    var onDataChanged: (() -> Void)? {get set}
}
