//
//  CreateAccountViewController.swift
//  LoginForm
//
//  Created by Zac Workman on 05/03/2019.
//  Copyright © 2019 Kwip Limited. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var createBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    
    
    @IBAction func createBtnTapped(_ sender: Any) {
        
    }
    
    @IBAction func cancelBtnTapped(_ sender: Any) {
        
    }
    
    @IBAction func usernameDidEndOnExit(_ sender: Any) {
        
    }
    
    @IBAction func passwordDidEndOnExit(_ sender: Any) {
        
    }
    
    @IBAction func confirmPasswordDidEndOnExit(_ sender: Any) {
        
    }
    
    @IBAction func emailDidEndOnExit(_ sender: Any) {
        
    }
}


extension CreateAccountViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
}
