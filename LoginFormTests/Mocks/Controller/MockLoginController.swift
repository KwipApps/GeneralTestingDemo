//
//  MockLoginController.swift
//  LoginFormTests
//
//  Created by Zac Workman on 06/03/2019.
//  Copyright © 2019 Kwip Limited. All rights reserved.
//

import Foundation
import XCTest

class MockLoginController: LoginController {
    private var expectation: XCTestExpectation?
    private var expectedUsername: String?
    private var expectedPassword: String?
    
    var shouldReturnTrueOnLogin: Bool
    
    init(_ expectation: XCTestExpectation, expectedUsername: String, expectedPassword: String) {
        self.expectation = expectation
        self.expectedUsername = expectedUsername
        self.expectedPassword = expectedPassword
        self.shouldReturnTrueOnLogin = false
        
        super.init(delegate: nil)
    }
    
    override func doLogin(model: LoginModel) {
        if let expectation = self.expectation,
            let expectedUsername = self.expectedUsername,
            let expectedPassword = self.expectedPassword {
            
            if model.userName == expectedUsername && model.password == expectedPassword {
                expectation.fulfill()
            }
        }
        
        loginControllerDelegate?.loginResult(result: shouldReturnTrueOnLogin)
    }
}
