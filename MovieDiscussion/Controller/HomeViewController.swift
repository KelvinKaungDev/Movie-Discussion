import UIKit
import FirebaseAuth

class HomeViewController : UIViewController, MovieProtocol {

    @IBOutlet var searchField: UITextField!
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var search: UIButton!
    @IBOutlet var movieImg: UIImageView!
    
    var movie = MovieApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movie.delegate = self
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    @IBAction func search(_ sender: UIButton) {
        movie.getData()
    }
    
    @IBAction func logoutButton(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
    
    func dataCollections(data: MovieDataCollections) {
        DispatchQueue.main.async {
            let count = data.result()
            self.movieTitle.text = data.results[count].poster_path
        }
    }
    
}
