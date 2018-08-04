import UIKit

protocol TabBarView: BaseView {
    var onItemFlowSelect: ((UINavigationController) -> Void)? { get set }
    var onSettingsFlowSelect: ((UINavigationController) -> Void)? { get set }
    var onBasketFlowSelect: ((UINavigationController) -> Void)? { get set }
    var onViewDidLoad: ((UINavigationController) -> Void)? { get set }
    var onExit: (() -> Void)? { get set }
}
