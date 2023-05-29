import UIKit
import FirebaseAuth
import FirebaseFirestore

class RegisterController : UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerButton(_ sender: Any) {
        register()
    }
    
    func register() {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let e = error {
                    print("error \(e)")
                } else {
                    if let name = self.nameTextField.text, let uid = result?.user.uid {
                        self.db.collection("users").addDocument(data: [
                            K.Auth.name : name,
                            K.Auth.uid : uid
                        ]) { error in
                            if let e = error {
                                print("\(e)")
                            }
                            self.performSegue(withIdentifier: K.Auth.RegisterToHome, sender: self)
                        }
                    }
                }
            }
        }
    }
    
}
