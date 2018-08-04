import UIKit

class AuthVC: UIViewController, AuthView {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var viewModel: AuthViewModel?
    
    var onCompleteAuth: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = AuthViewModel()
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
    
    @IBAction func registered(segue: UIStoryboardSegue) {
        guard let userInfo = (segue.source as? RegisterVC)?.userInfo else {
            return
        }
        viewModel?.register(userInfo: userInfo, completionHandler: {[weak self] recievedError in
            if let error = recievedError {
               self?.showAlert(error: error, title: "Ooops")
            } else {
                self?.tryToLogin()
            }
        })
    }
}

extension AuthVC {
    @IBAction func register(_ sender: Any) {
        self.performSegue(withIdentifier: "toRegister", sender: self)
    }
    
    @IBAction func login(_ sender: Any) {
        tryToLogin()
    }
    
    private func tryToLogin() {
        viewModel?.login(userName: "", password: "", completionHandler: {[weak self] recievedError in
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
