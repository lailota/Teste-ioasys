//
//  ViewController.swift
//  Teste ioasys - Laila
//
//  Created by Laila Guzzon Hussein Lailota on 24/06/21.
//

import Foundation
import UIKit
import SystemConfiguration

class LoginViewController: UIViewController {
    
    private var iconClick = true

    var model: LoginApiModel = {
        return LoginApiModel.api
    }()
   
    var initial = LoginApiModel()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var bemVindoLabel: UILabel!
    @IBOutlet weak var pequenoLogo: UIImageView!
    @IBOutlet weak var eyeButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var incorrectLabel: UILabel!
    @IBOutlet weak var wrongButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.returnKeyType = .next
        loginButton.layer.cornerRadius = 10
        emailTextField.layer.cornerRadius = 10
        passwordTextField.layer.cornerRadius = 10
        wrongButton.isHidden = true
        emailButton.isHidden = true
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @IBAction func entrarButtonTapped(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            if !LoginFormModelValidator.isEmailValid(email: email) && !LoginFormModelValidator.IsPasswordValid(password: password) {
                incorrectLabel.textColor = #colorLiteral(red: 0.8784313725, green: 0, blue: 0, alpha: 1)
                emailTextField.layer.borderWidth = 0.5
                emailTextField.layer.borderColor = #colorLiteral(red: 0.8784313725, green: 0, blue: 0, alpha: 1)
                passwordTextField.layer.borderWidth = 0.5
                passwordTextField.layer.borderColor = #colorLiteral(red: 0.8784313725, green: 0, blue: 0, alpha: 1)
                emailButton.imageView?.tintColor = #colorLiteral(red: 0.8784313725, green: 0, blue: 0, alpha: 1)
                eyeButton.isHidden = true
                wrongButton.isHidden = false
                emailButton.isHidden = false
              
                return
            }
        }
        
        
        doLogin()
    }
    
    
    private func doLogin() {
        let email = emailTextField.text
        let password = passwordTextField.text
        
        initial.authenticate(email: email ?? "", password: password ?? "")
        
        do {
            sleep(3)
        }
        self.performSegue(withIdentifier: "EntrerpriseViewController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        _ = segue.destination as! EntrerpriseViewController
        
    }

    @IBAction func showPasswordTapped(_ sender: UIButton) {
        if(iconClick == true) {
            passwordTextField.isSecureTextEntry = false
        } else {
            passwordTextField.isSecureTextEntry = true
        }
        
        iconClick = !iconClick
    }
    
    
    @objc func keyboardWillShow(_ notification: Notification) {
        animation()
    }

    @objc func keyboardWillHide(_ notification: Notification) {
        endAnimation()
    }
    
    func animation() {
        UIView.animate(withDuration: 0.5){
            self.logoView.frame.origin.y = -122
            self.logoView.layoutIfNeeded()
            self.pequenoLogo.frame.origin.y = 170
            self.pequenoLogo.layoutIfNeeded()
        }
        UIView.animate(withDuration: 0.0000001) {
            self.bemVindoLabel.alpha = 0
        }
    }
    
    func endAnimation() {
        UIView.animate(withDuration: 0.5) {
            self.logoView.frame.origin.y = 0
            self.logoView.layoutIfNeeded()
            self.pequenoLogo.frame.origin.y = 130
            self.pequenoLogo.layoutIfNeeded()
        }
        UIView.animate(withDuration: 0.3) {
            self.bemVindoLabel.alpha = 1
        }
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
}

extension LoginViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        switch textField {
        case self.emailTextField:
            passwordTextField.becomeFirstResponder()
        default:
            passwordTextField.resignFirstResponder()
        }
        return true
    }
    
    
}
