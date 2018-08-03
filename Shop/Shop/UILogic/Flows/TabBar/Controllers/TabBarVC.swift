import UIKit

class TabbarVC: UITabBarController, UITabBarControllerDelegate, TabBarView {
    
    var onBasketFlowSelect: ((UINavigationController) -> ())?
    var onItemFlowSelect: ((UINavigationController) -> ())?
    var onSettingsFlowSelect: ((UINavigationController) -> ())?
    var onViewDidLoad: ((UINavigationController) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        if let controller = customizableViewControllers?.first as? UINavigationController {
            onViewDidLoad?(controller)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: nil)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let controller = viewControllers?[selectedIndex] as? UINavigationController else { return }
        
        if selectedIndex == 0 {
            onItemFlowSelect?(controller)
        } else if selectedIndex == 1 {
            onSettingsFlowSelect?(controller)
        } else if selectedIndex == 2 {
            onBasketFlowSelect?(controller)
        }
    }
}
