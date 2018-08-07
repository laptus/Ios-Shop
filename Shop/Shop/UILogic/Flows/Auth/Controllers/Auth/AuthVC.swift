import UIKit

class AuthVC: UIViewController, AuthView {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var viewModel: AuthViewModel?
    
    var onCompleteAuth: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyBoardWasShown),
                                               name: NSNotification.Name.UIKeyboardWillShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillBeHidden),
                                               name: NSNotification.Name.UIKeyboardWillHide,
                                               object: nil)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name.UIKeyboardWillShow,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name.UIKeyboardWillHide,
                                                  object: nil)
    }
    
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {}
    
    @IBAction func registered(segue: UIStoryboardSegue) {

    }
}

extension AuthVC {
    @IBAction func register(_ sender: Any) {
        self.performSegue(withIdentifier: "toRegister", sender: self)
    }
    
    @IBAction func login(_ sender: Any) {
        if let log = login.text,
            let pass = password.text {
            tryToLogin(name: log, password: pass)
        }
    }
    
    private func tryToLogin(name: String, password: String) {
        
            viewModel?.login(userName: name, password: password, completionHandler: {[weak self] recievedError in
                if let error = recievedError as? Errors {
                    guard let vc = self else { return }
                    Alert.showLoginError(for: vc, error: error, actionHandler: {_ in
                        vc.performSegue(withIdentifier: "toRegister", sender: self)
                    })
                } else {
                    self?.onCompleteAuth?()
                }
            })
        
    }
}

extension AuthVC {
    @objc private func keyBoardWasShown(notification: Notification) {
        guard
            let info = notification.userInfo as? NSDictionary,
            let kbSize = (info.value(forKey: UIKeyboardFrameEndUserInfoKey) as? NSValue)?
                .cgRectValue.size else { return }
            
            let contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0)
            self.scrollView?.contentInset = contentInsets
            scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc private func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc private func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
}
