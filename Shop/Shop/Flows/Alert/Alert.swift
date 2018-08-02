import UIKit

struct Alert {
    static func showCatalagError(for vc: UIViewController) {
        showAlert(for: vc,
                  title: "Error",
                  message: "Can't get catalog")
    }
    
    static func showGoodError(for vc: UIViewController) {
        showAlert(for: vc,
                  title: "Error",
                  message: "Can't get good info")
    }
    
    static func showUserInfoError(for vc: UIViewController) {
        showAlert(for: vc,
                  title: "Error",
                  message: "Can't change user info")
    }
    
    private static func showAlert(for vc: UIViewController,
                                  title: String,
                                  message: String) {
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "OK",
                                   style: UIAlertActionStyle.default,
                                   handler: nil)
        alertController.addAction(action)
        vc.present(alertController, animated: false)
    }
    
    static func showLoginError(for vc: UIViewController,
                               actionHandler: ((UIAlertAction) -> Void)?) {
        
        showAlertWithAction(for: vc, title: "Error",
                            message: "Can't login. Maybe you are not registered",
                            titleForAction: "Register",
                            actionHandler: actionHandler)
    }
    
    private static func showAlertWithAction(for vc: UIViewController,
                                            title: String,
                                            message: String,
                                            titleForAction: String,
                                            actionHandler: ((UIAlertAction) -> Void)?) {
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: UIAlertControllerStyle.alert)
        
        let action = UIAlertAction(title: "OK",
                                   style: UIAlertActionStyle.default,
                                   handler: nil)
        let additionalAction = UIAlertAction(title: titleForAction,
                                             style: UIAlertActionStyle.default,
                                             handler: actionHandler)
        alertController.addAction(action)
        alertController.addAction(additionalAction)
        vc.present(alertController, animated: false)
    }
}
