//
//  LoginViewControllerProtocol.swift
//  LoginForm
//
//  Created by Zac Workman on 06/03/2019.
//  Copyright © 2019 Kwip Limited. All rights reserved.
//

import Foundation

protocol LoginViewControllerProtocol: class {
    func clearUsernameField()
    func clearPasswordField()
    func enableLoginButton(_ enabled: Bool)
    func enableCreateAccountButton(_ enabled: Bool)
    func hideKeyboard()
}
