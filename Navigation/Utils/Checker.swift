//
//  Checker.swift
//  Navigation
//
//  Created by Александр Востриков on 25.04.2022.
//

import Foundation

class Checker {
    
    static let shared = Checker()
    
    private let login = Constants.login
    private let password = Constants.password
    
    private init () {}
    
    func checkCredential(for pass: String, login: String ) throws {
        if !(self.login == login.hash && self.password == pass.hash) {
            throw LoginError.incorrectCredentials
        }
    }
}
