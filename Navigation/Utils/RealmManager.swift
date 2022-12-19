//
//  RealmManager.swift
//  Navigation
//
//  Created by Александр Востриков on 14.12.2022.
//

import Foundation
import RealmSwift

final class RealmManager {
    
    var users: [UserRealm] = []
    
    let realm: Realm
    
    init() {
        let config = Realm.Configuration(
            schemaVersion: 4)
        Realm.Configuration.defaultConfiguration = config
        
        realm = try! Realm()
        
        reloadDataFromDB()
    }
    func reloadDataFromDB(){
        users = Array(realm.objects(UserRealm.self))
    }
    
    func writeData(login: String, password: String) throws {
        try realm.write {
            let user = UserRealm(login: login, password: password)
            user.passwordLastDateChanged = Date()
                realm.add(user)
        }
    }

    func readUser() -> UserRealm? {
        let resultUsers = realm.objects(UserRealm.self).where {
            $0.isLoggedIn == true
        }
        return resultUsers.first
    }
    
    func update(user: UserRealm, with date: Date?) throws {
        
        try realm.write {
            if let date = date {
                user.lastLogin = date
                user.isLoggedIn = true
            } else {
                user.lastLogin = nil
                user.isLoggedIn = false
            }
        }
    }
}
