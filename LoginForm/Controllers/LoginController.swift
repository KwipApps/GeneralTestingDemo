//
//  LoginController.swift
//  LoginForm
//
//  Created by Zac Workman on 06/03/2019.
//  Copyright © 2019 Kwip Limited. All rights reserved.
//

import Foundation

protocol LoginControllerDelegate: class {
    func loginResult(result: Bool)
}

class LoginController {
    let dummyUsername = "Wac"
    let dummyPassword = "Zorkman"
    
    weak var loginControllerDelegate: LoginControllerDelegate?
    
    init(delegate: LoginControllerDelegate?) {
        self.loginControllerDelegate = delegate
    }
    
    func doLogin(model: LoginModel) {
        let username = model.userName
        let password = model.password
        
        if username == dummyUsername && password == dummyPassword {
            loginControllerDelegate?.loginResult(result: true)
            return
        }
        loginControllerDelegate?.loginResult(result: false)
    }
}
