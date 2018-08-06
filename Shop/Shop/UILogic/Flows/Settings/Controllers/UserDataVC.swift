import UIKit

class UserDataVC: UIViewController, SettingsView {
    
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var creditCard: UITextField!
    @IBOutlet weak var bio: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var editButton: UIButton!
    
    var viewModel: SettingsViewModel?
    
    @IBAction func changeUserData(_ sender: Any) {
        if isEditable {
            changeData()
        } else {
            isEditable = true
             editButton.setTitle("Done", for: UIControlState.normal)
        }
    }
    
    func changeData() {
        let alertController = UIAlertController(title: "Mutation",
                                                message: "Really change?",
                                                preferredStyle: UIAlertControllerStyle.alert)
        let okActionction = UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: {[weak self] _ in
           
            self?.editButton.setTitle("Change", for: UIControlState.normal)
        })
        let cancelAction = UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: {[weak self] _ in
            self?.becomeFirstResponder()
            self?.isEditable = false
            self?.editButton.setTitle("Change", for: UIControlState.normal)
        })
        alertController.addAction(okActionction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: false)
    }
    
    var isEditable: Bool = false {
        didSet {
            changeViewState(isEditable: isEditable)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isEditable = false
    }
    
    func changeViewState(isEditable: Bool) {
        self.view.subviews
            .filter { $0 is UITextField }
            .map { $0 as! UITextField }
            .forEach { $0.isEnabled = isEditable }
    }
    
    func changeUserData() {
        if let id = (UserDefaults.standard.value(forKey: "userId") as? UserInfo)?.id,
            let name = nameField.text,
            let pass = password.text,
            let eMail = email.text,
            let bioText = bio.text,
            let card = creditCard.text,
            let genderText = gender.text {
            
            let user = UserInfo(id: id,
                                name: name,
                                password: pass,
                                eMail: eMail,
                                bio: bioText,
                                creditcard: card,
                                gender: genderText)
            viewModel?.changeInfo(userInfo: user, completionHandler: {[weak self] recievedError, success in
                if let error = recievedError,
                    let vc = self {
                    Alert.showRegisterError(for: vc, error: error)
                } else {
                    if !success {
                        self?.setUser()
                    }
                }
            })
        }
    }
    
    func setUser() {
        UserDefaults.standard.value(forKey: "userId")
        nameField.text = UserDefaults.standard.value(forKey: "userName") as! String
        password.text = UserDefaults.standard.value(forKey: "userPassword") as! String
        bio.text = UserDefaults.standard.value(forKey: "userBio") as! String
        creditCard.text = UserDefaults.value(forKey: "userCard") as! String
        email.text = UserDefaults.standard.value(forKey: "userMail") as! String
        gender.text = UserDefaults.standard.value(forKey: "userGender") as! String

    }
}
