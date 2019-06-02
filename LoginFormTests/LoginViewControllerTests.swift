//
//  LoginViewControllerTests.swift
//  LoginFormTests
//
//  Created by Zac Workman on 06/03/2019.
//  Copyright © 2019 Kwip Limited. All rights reserved.
//

import Foundation
import XCTest
@testable import LoginForm

class LoginViewControllerTests: XCTestCase {
    
    fileprivate var validUsername = "abcdefghij"
//    fileprivate var invalidUsername = "a"
    
    fileprivate var validPassword = "D%io7AFn9Y"
//    fileprivate var invalidPassword = "a3$Am"
    
}



// MARK: Setup

extension LoginViewControllerTests {
    
    func testViewDidLoad_Calls_PerformInitialSetup_OnViewModel() {
        let exp = expectation(description: "Expected performInitialSetup() to be called")
        let loginVC = LoginViewController()
        
        let viewModel = MockLoginViewModel(view: loginVC)
        viewModel.performInitialViewSetupExpectation = exp
        
        loginVC.viewModel = viewModel
        loginVC.viewDidLoad()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
}



// MARK: didEndOnExit

extension LoginViewControllerTests {
    
    func testUsernameDidEndOnExit_Calls_UsernameDidEndOnExit_OnViewModel() {
        let exp = expectation(description: "Expected usernameDidEndOnExit() to be called on the viewModel")
        
        let loginVC = LoginViewController()
        
        let viewModel = MockLoginViewModel(view: loginVC)
        viewModel.usernameDidEndOnExitExpectation = exp
        
        loginVC.viewModel = viewModel
        loginVC.usernameDidEndOnExit(self)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPasswordDidEndOnExit_Calls_PasswordDidEndOnExit_OnViewModel() {
        let exp = expectation(description: "Expected passwordDidEndOnExit() to be called on the viewModel")
        
        let loginVC = LoginViewController()
        
        let viewModel = MockLoginViewModel(view: loginVC)
        viewModel.passwordDidEndOnExitExpectation = exp
        
        loginVC.viewModel = viewModel
        loginVC.passwordDidEndOnExit(self)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
}



// MARK: login

extension LoginViewControllerTests {
    
    func testLogin_ValidUsernameAndPassword_Calls_Login_OnViewModel_WithExpectedUsername() {
        let exp = expectation(description: "Expected login() to be called with the username passed in")
        
        let usernameTextFieldStub = UITextFieldStub(text: validUsername)
        let passwordTextFieldStub = UITextFieldStub(text: "")
        
        let loginVC = LoginViewController()
        loginVC.usernameTF = usernameTextFieldStub
        loginVC.passwordTF = passwordTextFieldStub
        
        let viewModel = MockLoginViewModel(view: loginVC)
        viewModel.loginExpectation = (exp, validUsername, "")
        
        loginVC.viewModel = viewModel
        loginVC.loginBtnTapped(self)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testLogin_ValidUsernameAndPassword_Calls_Login_OnViewModel_WithExpectedPassword() {
        let exp = expectation(description: "Expected login() to be called with the password passed in")
        
        let usernameTextFieldStub = UITextFieldStub(text: "")
        let passwordTextFieldStub = UITextFieldStub(text: validPassword)
        
        let loginVC = LoginViewController()
        loginVC.usernameTF = usernameTextFieldStub
        loginVC.passwordTF = passwordTextFieldStub
        
        let viewModel = MockLoginViewModel(view: loginVC)
        viewModel.loginExpectation = (exp, "", validPassword)
        
        loginVC.viewModel = viewModel
        loginVC.loginBtnTapped(self)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func testTextField_ShouldChangeCharacters_UsernameTextField_Calls_UsernameUpdated_OnViewModel_WithExpectedUsername() {
        let exp = expectation(description: "Expected usernameUpdated() to be called")
        
        let usernameTextFieldStub = UITextFieldStub(text: validUsername)
        let passwordTextFieldStub = UITextFieldStub(text: validPassword)
        
        let loginVC = LoginViewController()
        loginVC.usernameTF = usernameTextFieldStub
        loginVC.passwordTF = passwordTextFieldStub
        
        let viewModel = MockLoginViewModel(view: loginVC)
        viewModel.usernameUpdatedExpectation = (exp, expectedValue: validUsername)
        
        loginVC.viewModel = viewModel
        
        let _ = loginVC.textField(usernameTextFieldStub,
                                              shouldChangeCharactersIn: NSMakeRange(0, 1),
                                              replacementString: "A")
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testTextField_ShouldChangeCharacters_PasswordTextField_Calls_PasswordUpdated_OnViewModel_WithExpectedPassword() {
        let exp = expectation(description: "Expected passwordUpdated() to be called")
        
        let usernameTextFieldStub = UITextFieldStub(text: validUsername)
        let passwordTextFieldStub = UITextFieldStub(text: validPassword)
        
        let loginVC = LoginViewController()
        loginVC.usernameTF = usernameTextFieldStub
        loginVC.passwordTF = passwordTextFieldStub
        
        let viewModel = MockLoginViewModel(view: loginVC)
        viewModel.passwordUpdatedExpectation = (exp, expectedValue: validPassword)
        
        loginVC.viewModel = viewModel
        
        let _ = loginVC.textField(passwordTextFieldStub,
                                              shouldChangeCharactersIn: NSMakeRange(0, 1),
                                              replacementString: "A")
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
}
