//
//  ViewController.swift
//  Teste ioasys - Laila
//
//  Created by Laila Guzzon Hussein Lailota on 24/06/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        loginButton.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }


    
    @IBAction func entrarButtonTapped(_ sender: UIButton) {
    }
    
    
    @IBAction func showPasswordTapped(_ sender: UIButton) {
    }
    
}

