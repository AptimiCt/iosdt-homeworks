//
//  LoginInspector.swift
//  Navigation
//
//  Created by Александр Востриков on 25.04.2022.
//

import Foundation

class LoginInspector: LoginViewControllerDelegate {
    
    func checkerLoginInspector(for password: String, login: String) throws {
        try Checker.shared.checkCredential(for: password, login: login)
    }
}


