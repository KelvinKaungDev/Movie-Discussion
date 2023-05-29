import UIKit
import FirebaseAuth

class LoginController : UIViewController {
    
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func login(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print("\(e)")
                } else {
                    self.performSegue(withIdentifier: K.Auth.LoginToHome, sender: self)
                }
//                if let e = error {
//                    print("\(e)")
//                } else {
//                }
            }
        }
    }
    
}
