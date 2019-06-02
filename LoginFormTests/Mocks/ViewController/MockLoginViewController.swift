//
//  MockLoginViewController.swift
//  LoginFormTests
//
//  Created by Zac Workman on 06/03/2019.
//  Copyright © 2019 Kwip Limited. All rights reserved.
//

import UIKit
import XCTest

class MockLoginViewController: LoginViewControllerProtocol {
    
    var expectationClearUsernameField: XCTestExpectation?
    var expectationClearPasswordField: XCTestExpectation?
    var expectationEnableLoginButton: (XCTestExpectation, Bool)?
    var expectationEnableCreateAccountButton: (XCTestExpectation, Bool)?
    var expectationForHideKeyboard: XCTestExpectation?
    
    func clearUsernameField() {
        expectationClearUsernameField?.fulfill()
    }
    
    func clearPasswordField() {
        expectationClearPasswordField?.fulfill()
    }
    
    func enableLoginButton(_ enabled: Bool) {
        if let (expectation, expectedValue) = expectationEnableLoginButton {
            if enabled == expectedValue { expectation.fulfill() }
        }
    }
    
    func enableCreateAccountButton(_ enabled: Bool) {
        if let (expectation, expectedValue) = expectationEnableCreateAccountButton {
            if enabled == expectedValue { expectation.fulfill() }
        }
    }
    
    func hideKeyboard() {
        expectationForHideKeyboard?.fulfill()
    }
    
}
