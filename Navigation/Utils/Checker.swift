//
//  Checker.swift
//  Navigation
//
//  Created by Александр Востриков on 25.04.2022.
//

import Foundation

class Checker {
    public static var shared = Checker()
    
    private let login = Constants.login
    private let password = Constants.password
    
    private init () {}
    
    func checkCredential(for pass: String, login: String ) -> Bool {
        if self.login == login.hash && self.password == pass.hash {
            return true
        }
        return false
    }
}
