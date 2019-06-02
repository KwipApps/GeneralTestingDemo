//
//  MockLoginViewModel.swift
//  LoginFormTests
//
//  Created by Zac Workman on 06/03/2019.
//  Copyright © 2019 Kwip Limited. All rights reserved.
//

import Foundation
import XCTest

class MockLoginViewModel: LoginViewModel {
    
    var performInitialViewSetupExpectation: XCTestExpectation?
    var usernameDidEndOnExitExpectation: XCTestExpectation?
    var passwordDidEndOnExitExpectation: XCTestExpectation?
    var usernameUpdatedExpectation: (XCTestExpectation, expectedValue: String)?
    var passwordUpdatedExpectation: (XCTestExpectation, expectedValue: String)?
    var loginExpectation: (XCTestExpectation, expectedUsername: String, expectedUsername: String)?
    
    
    override init(view: LoginViewControllerProtocol) {
        super.init(view: view)
    }
    
    override func performInitialViewSetup() {
        performInitialViewSetupExpectation?.fulfill()
    }
    
    override func usernameDidEndOnExit() {
        usernameDidEndOnExitExpectation?.fulfill()
    }
    
    override func passwordDidEndOnExit() {
        passwordDidEndOnExitExpectation?.fulfill()
    }
    
    override func usernameUpdated(_ value: String?) {
        if let (expectation, expectedValue) = usernameUpdatedExpectation,
            let value = value {
            if value == expectedValue { expectation.fulfill() }
        }
    }
    
    override func passwordUpdated(_ value: String?) {
        if let (expectation, expectedValue) = passwordUpdatedExpectation,
            let value = value {
            if value == expectedValue { expectation.fulfill() }
        }
    }
    
    override func login(username: String?, password: String?) {
        if let (expectation, expectedUsername, expectedPassword) = loginExpectation,
            let username = username,
            let password = password {
            if username == expectedUsername, password == expectedPassword { expectation.fulfill() }
        }
    }
}

