//
//  LoginViewModelTests.swift
//  LoginFormTests
//
//  Created by Zac Workman on 06/03/2019.
//  Copyright © 2019 Kwip Limited. All rights reserved.
//

import XCTest
//@testable import LoginForm

class LoginViewModelTests: XCTestCase {
    
    fileprivate var mockViewController: MockLoginViewController?
    
    fileprivate var validUsername = "abcdefghij"
    fileprivate var invalidUsername = "a"
    
    fileprivate var validPassword = "D%io7AFn9Y"
    fileprivate var invalidPassword = "a3$Am"

    override func setUp() {
        super.setUp()
        
        mockViewController = MockLoginViewController()
    }
}


extension LoginViewModelTests {

    func testInit_ValidView_InstantiatesObject() {
        let viewModel = LoginViewModel(view: mockViewController!)
        XCTAssertNotNil(viewModel)
    }
    
    func testInit_ValidView_CopiesViewToIvar() {
        let viewModel = LoginViewModel(view: mockViewController!)
        
        if let lhs = mockViewController, let rhs = viewModel.view as? MockLoginViewController {
            XCTAssert(lhs === rhs)
        }
    }
    
}



// MARK: perfornInitialViewSetup tests

extension LoginViewModelTests {
    
    func testPerformInitialViewSetup_Calls_ClearUsernameField_OnViewController() {
        let exp = self.expectation(description: "expected ClearUsernameField() to be called")
        mockViewController!.expectationClearUsernameField = exp
        
        let viewModel = LoginViewModel(view: mockViewController!)
        viewModel.performInitialViewSetup()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPerformInitialViewSetup_Calls_ClearPasswordField_OnViewController() {
        let exp = expectation(description: "Expected ClearPasswordField() to be called")
        mockViewController!.expectationClearPasswordField = exp
        
        let viewModel = LoginViewModel(view: mockViewController!)
        viewModel.performInitialViewSetup()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPerformInitialViewSetup_DisablesLoginButton_OnViewController() {
        let exp = expectation(description: "Expected EnableLoginButton(false) to be called")
        mockViewController!.expectationEnableLoginButton = (exp, false)
        
        let viewModel = LoginViewModel(view: mockViewController!)
        viewModel.performInitialViewSetup()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPerformInitialViewSetup_EnablesCreateAccountButton_OnViewController() {
        let exp = expectation(description: "Expected EnableCreateAccountButton(true) to be called")
        mockViewController!.expectationEnableCreateAccountButton = (exp, true)
        
        let viewModel = LoginViewModel(view: mockViewController!)
        viewModel.performInitialViewSetup()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
}



// MARK: usernameDidEndOnExit tests

extension LoginViewModelTests {
    
    func testUsernameDidEndOnExit_Calls_HideKeyboard_OnViewController() {
        let exp = expectation(description: "Expected HideKeyboard() to be called when usernameDidEndOnExit is called")
        mockViewController!.expectationForHideKeyboard = exp
        
        let viewModel = LoginViewModel(view: mockViewController!)
        viewModel.usernameDidEndOnExit()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPasswordDidEndOnExit_Calls_HideKeyboard_OnViewController() {
        let exp = expectation(description: "Expected HideKeyboad() to be called when passwordDidEndOnExit is called")
        mockViewController!.expectationForHideKeyboard = exp
        
        let viewModel = LoginViewModel(view: mockViewController!)
        viewModel.passwordDidEndOnExit()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
}




// MARK: usernameUpdatedTests

extension LoginViewModelTests {
    
    func testUsernameUpdated_Calls_Validate_OnUsernameValidator() {
        let exp = expectation(description: "Expected validate() to be called")
        
        let viewModel = LoginViewModel(view: mockViewController!)
        viewModel.usernameValidator = MockUserNameValidator(exp, expectedValue: validUsername)
        viewModel.usernameUpdated(validUsername)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testUsernameUpdated_ValidUsername_PasswordValidated_EnablesLoginButton_OnViewController() {
        let exp = expectation(description: "Expected enableLogin(true) to be called")
        mockViewController!.expectationEnableLoginButton = (exp, true)
        
        let viewModel = LoginViewModel(view: mockViewController!)
        viewModel.passwordValidated = true
        viewModel.usernameUpdated(validUsername)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testUsernameUpdated_ValidUsername_PasswordNotValidated_DisablesLoginButton_OnViewController() {
        let exp = expectation(description: "Expected enableLogin(false) to be called")
        mockViewController!.expectationEnableLoginButton = (exp, false)
        
        let viewModel = LoginViewModel(view: mockViewController!)
        viewModel.passwordValidated = false
        viewModel.usernameUpdated(validUsername)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testUsernameUpdated_InvalidUsername_PasswordValidated_DisablesLoginButton_OnViewController() {
        let exp = expectation(description: "Expected enableLogin(false) to be called")
        mockViewController!.expectationEnableLoginButton = (exp, false)
        
        let viewModel = LoginViewModel(view: mockViewController!)
        viewModel.passwordValidated = true
        viewModel.usernameUpdated(invalidUsername)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testUsernameUpdated_InvalidUsername_PasswordNotValidated_DisablesLoginButton_OnViewController() {
        let exp = expectation(description: "Expected enableLogin(false) to be called")
        mockViewController!.expectationEnableLoginButton = (exp, false)
        
        let viewModel = LoginViewModel(view: mockViewController!)
        viewModel.passwordValidated = false
        viewModel.usernameUpdated(invalidUsername)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
}



// MARK: passwordUpdated Tests

extension LoginViewModelTests {
    
    func testPasswordUpdated_Calls_Validate_OnPasswordValidator() {
        let exp = expectation(description: "Expected Validate() to be called")
        
        let viewModel = LoginViewModel(view: mockViewController!)
        viewModel.passwordValidator = MockPasswordValidator(exp, expectedValue: validPassword)
        viewModel.passwordUpdated(validPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testPasswordUpdated_ValidPassword_UsernameValidated_EnablesLoginButton_OnViewController() {
        let exp = expectation(description: "Expected EnableLoginButton(true) to be called")
        mockViewController?.expectationEnableLoginButton = (exp, true)
        
        let viewModel = LoginViewModel(view: mockViewController!)
        viewModel.usernameValdated = true
        viewModel.passwordUpdated(validPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPasswordUpdated_ValidPassword_UsernameNotValidated_DisablesLoginButton_OnViewController() {
        let exp = expectation(description: "Expected EnableLoginButton(false) to be called")
        mockViewController?.expectationEnableLoginButton = (exp, false)
        
        let viewModel = LoginViewModel(view: mockViewController!)
        viewModel.usernameValdated = false
        viewModel.passwordUpdated(validPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPasswordUpdated_InvalidPassword_UsernameValidated_DisablesLoginButton_OnViewController() {
        let exp = expectation(description: "Expected EnableLoginButton(false) to be called")
        mockViewController?.expectationEnableLoginButton = (exp, false)
        
        let viewModel = LoginViewModel(view: mockViewController!)
        viewModel.usernameValdated = true
        viewModel.passwordUpdated(invalidPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPasswordUpdated_InvalidPassword_UsernameNotValidated_DisablesLoginButton_OnViewController() {
        let exp = expectation(description: "Expected EnableLoginButton(false) to be called")
        mockViewController?.expectationEnableLoginButton = (exp, false)
        
        let viewModel = LoginViewModel(view: mockViewController!)
        viewModel.usernameValdated = false
        viewModel.passwordUpdated(invalidPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
}




// MARK: login tests

extension LoginViewModelTests {
    
    func testLogin_ValidParameters_Calls_DoLogin_OnLoginController() {
        let exp = expectation(description: "Expected doLogin() to be called")
        
        let mockLoginController = MockLoginController(exp, expectedUsername: validUsername, expectedPassword: validPassword)
//        mockLoginController.shouldReturnTrueOnLogin = true
        
        let viewModel = LoginViewModel(view: mockViewController!)
        viewModel.loginController = mockLoginController
        
//        mockLoginController.loginControllerDelegate = viewModel
        
        viewModel.login(username: validUsername, password: validPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testLogin_ValidParameters_Calls_DoLoginWithExpectedUsername_OnLoginController() {
        let exp = expectation(description: "Expected doLogin() to be called")
        
        let mockLoginController = MockLoginController(exp, expectedUsername: validUsername, expectedPassword: validPassword)
//        mockLoginController.shouldReturnTrueOnLogin = true
        
        let viewModel = LoginViewModel(view: mockViewController!)
        viewModel.loginController = mockLoginController
        
//        mockLoginController.loginControllerDelegate = viewModel
        
        viewModel.login(username: validUsername, password: validPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testLogin_ValidParameters_Calls_DoLoginWithExpectedPassword_OnLoginController() {
        let exp = expectation(description: "Expected doLogin() to be called")
        
        let mockLoginController = MockLoginController(exp, expectedUsername: validUsername, expectedPassword: validPassword)
//        mockLoginController.shouldReturnTrueOnLogin = true
        
        let viewModel = LoginViewModel(view: mockViewController!)
        viewModel.loginController = mockLoginController
        
//        mockLoginController.loginControllerDelegate = viewModel
        
        viewModel.login(username: validUsername, password: validPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
}
