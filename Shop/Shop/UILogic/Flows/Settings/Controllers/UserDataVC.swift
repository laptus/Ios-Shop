import UIKit

class UserDataVC: UIViewController, SettingsView {
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var creditCard: UITextField!
    @IBOutlet weak var bio: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var editButton: UIButton!

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
    
    @IBAction func logOut(_ sender: Any) {
        
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
        
    }
}
