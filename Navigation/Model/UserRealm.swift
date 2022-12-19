//
//  UserRealm.swift
//  Navigation
//
//  Created by Александр Востриков on 14.12.2022.
//

import Foundation
import RealmSwift

class UserRealm: Object {
    
    @Persisted (primaryKey: true) var login: String
    @Persisted var password: Int
    @Persisted var passwordLastDateChanged: Date
    @Persisted var isLoggedIn: Bool
    @Persisted var lastLogin: Date?
    var avatar: Data? {
        FileManagerService().read(for: "avatar.jpg")
    }
    
    convenience init(login: String, password: String) {
        self.init()
        self.login = login
        self.password = password.hash
        self.passwordLastDateChanged = Date()
        self.isLoggedIn = false
        self.lastLogin = nil
    }
}
