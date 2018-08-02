import UIKit

class RegisterVC: UIViewController, RegisterView {
    var onCompleteRegister: (() -> Void)?
    
        
    var userInfo: UserInfo = UserInfo(id: 1, name: "", password: "", eMail: "", bio: "", creditcard: "", gender: "")

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
