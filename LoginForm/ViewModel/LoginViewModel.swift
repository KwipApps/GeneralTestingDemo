//
//  LoginViewModel.swift
//  LoginForm
//
//  Created by Zac Workman on 06/03/2019.
//  Copyright © 2019 Kwip Limited. All rights reserved.
//

import Foundation

class LoginViewModel {
    
    weak var view: LoginViewControllerProtocol?
    
    var loginController: LoginController?
    
    var usernameValidator: UserNameValidator?
    var passwordValidator: PasswordValidator?
    
    var usernameValdated: Bool
    var passwordValidated: Bool
    
    
    init(view: LoginViewControllerProtocol) {
        self.usernameValdated = false
        self.passwordValidated = false
        
        self.view = view
    }
    
    func performInitialViewSetup() {
        view?.clearUsernameField()
        view?.clearPasswordField()
        view?.enableLoginButton(false)
        view?.enableCreateAccountButton(true)
    }
    
    func usernameDidEndOnExit() {
        view?.hideKeyboard()
    }
    
    func passwordDidEndOnExit() {
        view?.hideKeyboard()
    }
    
    func usernameUpdated(_ value: String?) {
        guard let value = value else { view?.enableLoginButton(false); return }
        
        let validator = usernameValidator ?? UserNameValidator()
        usernameValdated = validator.validate(value)
        
        if !usernameValdated || !passwordValidated {
            view?.enableLoginButton(false)
            return
        }
        view?.enableLoginButton(true)
    }
    
    func passwordUpdated(_ value: String?) {
        guard let value = value else { view?.enableLoginButton(false); return }
        
        let validator = passwordValidator ?? PasswordValidator()
        passwordValidated = validator.validate(value)
        
        if !usernameValdated || !passwordValidated {
            view?.enableLoginButton(false)
            return
        }
        view?.enableLoginButton(true)
    }
    
    func login(username: String?, password: String?) {
        let controller = self.loginController ?? LoginController(delegate: self)
        
        if let username = username, let password = password, let model = LoginModel(userName: username, password: password) {
            controller.doLogin(model: model)
        }
    }
}



extension LoginViewModel: LoginControllerDelegate {
    
    func loginResult(result: Bool) {
        // do something...
    }
    
}
