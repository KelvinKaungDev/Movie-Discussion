//
//  ViewController.swift
//  MovieDiscussion
//
//  Created by Kaung Htet OO on 5/27/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var loginButton: UIButton!
    @IBOutlet var reigsterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func reigsterButton(_ sender: UIButton) {
        performSegue(withIdentifier: K.Segues.Register, sender: self)
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        performSegue(withIdentifier: K.Segues.Login, sender: self)
    }
    
}

