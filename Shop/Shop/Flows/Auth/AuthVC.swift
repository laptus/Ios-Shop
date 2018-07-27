import UIKit

class AuthVC: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var viewModel: AuthViewModel?
    
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
    
    @IBAction func registered(segue:UIStoryboardSegue) {
        let userInfo = (segue.source as! RegisterVC).userInfo
        viewModel?.register(userInfo: userInfo, completionHandler: {[weak self] recievedError in
            if let error = recievedError {
                // ошибку выдать
            } else {
                self?.tryToLogin()
            }
        })
    }
}

extension AuthVC {
    @IBAction func register(_ sender: Any) {
        //перейти на экран регистраии
    }
    
    @IBAction func login(_ sender: Any) {
        tryToLogin()
    }
    
    func tryToLogin() {
        viewModel?.login(userName: "", password: "", completionHandler: {[weak self] recievedError in
            if let error = recievedError {
                // ошибку выдать
            } else {
                self?.tryToLogin()
            }
        })
    }
}

extension AuthVC {
    @objc private func keyBoardWasShown(notification: Notification) {
        
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsetsMake(0.0,
                                             0.0,
                                             kbSize.height,
                                             0.0)
        
        
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
