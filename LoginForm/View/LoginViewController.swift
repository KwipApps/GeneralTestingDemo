//
//  LoginViewController.swift
//  LoginForm
//
//  Created by Zac Workman on 05/03/2019.
//  Copyright © 2019 Kwip Limited. All rights reserved.
//

// presentCreateAccount

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var createAccountBtn: UIButton!
    
    var viewModel: LoginViewModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if viewModel == nil { viewModel = LoginViewModel(view: self) }
        viewModel?.performInitialViewSetup()
    }
    
    
    
    @IBAction func loginBtnTapped(_ sender: Any) {
        viewModel?.login(username: usernameTF.text, password: passwordTF.text)
    }
    
    @IBAction func createAccountBtnTapped(_ sender: Any) {
        
    }
    
    @IBAction func usernameDidEndOnExit(_ sender: Any) {
        viewModel?.usernameDidEndOnExit()
    }
    
    @IBAction func passwordDidEndOnExit(_ sender: Any) {
        viewModel?.passwordDidEndOnExit()
    }
    
}


extension LoginViewController: LoginViewControllerProtocol {
    
    func clearUsernameField() {
        usernameTF.text = ""
    }
    
    func clearPasswordField() {
        passwordTF.text = ""
    }
    
    func enableLoginButton(_ enabled: Bool) {
        loginBtn.isEnabled = enabled
    }
    
    func enableCreateAccountButton(_ enabled: Bool) {
        createAccountBtn.isEnabled = enabled
    }
    
    func hideKeyboard() {
        usernameTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
    }
    
}


extension LoginViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == usernameTF {
            self.viewModel?.usernameUpdated(textField.text)
        } else if textField == passwordTF {
            self.viewModel?.passwordUpdated(textField.text)
        }
        return true
    }
    
}



