import UIKit

struct Alert {
    static func showCatalagError(for vc: UIViewController,
                                 error: Errors) {
        
        switch error.type {
        case .cantConnect:
            showServerError(for: vc)
        case .wrongRequest:
            showCatalagError(for: vc)
        default:
            return
        }
    }
    
    private static func showInputError(for vc: UIViewController) {
        showAlert(for: vc,
                  title: "Error",
                  message: "Wrong Data Entered")
    }
    
    private static func showServerError(for vc: UIViewController) {
        showAlert(for: vc,
                  title: "Error",
                  message: "Server error")
    }
    
    private static func showCatalagError(for vc: UIViewController) {
        showAlert(for: vc,
                  title: "Error",
                  message: "Can't get catalog")
    }
    
    static func showGoodError(for vc: UIViewController,
                              error: Errors) {
        
        switch error.type {
        case .cantConnect:
            showServerError(for: vc)
        case .wrongRequest:
            showGoodError(for: vc)
        default:
            return
        }
    }
    
    private static func showGoodError(for vc: UIViewController) {
        showAlert(for: vc,
                  title: "Error",
                  message: "Can't get good info")
    }
    
    static func showUserInfoError(for vc: UIViewController,
                                  error: Errors) {
        
        switch error.type {
        case .cantConnect:
            showServerError(for: vc)
        case .wrongRequest:
            showUserInfoError(for: vc)
        default:
            return
        }
    }
    
    private static func showUserInfoError(for vc: UIViewController) {
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
        DispatchQueue.main.async {
            vc.present(alertController, animated: false)
        }
    }
    
    static func showLoginError(for vc: UIViewController,
                               error: Errors,
                               actionHandler: ((UIAlertAction) -> Void)?) {
        
        switch error.type {
        case .cantConnect:
            showServerError(for: vc)
        case .wrongRequest:
            showLoginError(for: vc, actionHandler: actionHandler)
        default:
            return
        }
    }
    
    private static func showLoginError(for vc: UIViewController,
                                       actionHandler: ((UIAlertAction) -> Void)?) {
        
        showAlertWithAction(for: vc, title: "Error",
                            message: "Can't login. Maybe you are not registered",
                            titleForAction: "Register",
                            actionHandler: actionHandler)
    }
    
    static func showRegisterError(for vc: UIViewController,
                                  error: Errors) {
        
        switch error.type {
        case .cantConnect:
            showServerError(for: vc)
        case .wrongRequest:
            showRegisterError(for: vc)
        default:
            return
        }
    }
    
    private static func showRegisterError(for vc: UIViewController) {
        showAlert(for: vc, title: "Error",
                            message: "Can't register")
    }
    
    static func showChangeInfoError(for vc: UIViewController,
                                    error: Errors) {
        
        switch error.type {
        case .cantConnect:
            showServerError(for: vc)
        case .wrongRequest:
            showChangeInfoError(for: vc)
        default:
            return
        }
    }
    
    private static func showChangeInfoError(for vc: UIViewController) {
        showAlert(for: vc, title: "Error",
                  message: "Can't changeInfo")
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
        DispatchQueue.main.async {
            vc.present(alertController, animated: false)
        }
    }
}
