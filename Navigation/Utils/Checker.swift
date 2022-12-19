//
//  Checker.swift
//  Navigation
//
//  Created by Александр Востриков on 25.04.2022.
//

import Foundation

class Checker {
    
    static let shared = Checker()
    
    let rm: RealmManager
    let user: UserRealm?

    private init () {
        rm = RealmManager()
        user = rm.users.first
    }
    
    func checkCredential(for pass: String, login: String ) -> Bool {

        if let user = user, login == user.login, pass.hash == user.password {
            return true
        }
        return false
    }
}
