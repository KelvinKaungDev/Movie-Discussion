import UIKit
import FirebaseAuth

class HomeViewController : UIViewController {
    
    @IBOutlet var searchField: UITextField!
    
    override func viewDidLoad() {
       super.viewDidLoad()
       self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    @IBAction func logoutButton(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
}
