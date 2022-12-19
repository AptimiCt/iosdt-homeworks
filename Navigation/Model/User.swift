//
//  User.swift
//  Navigation
//
//  Created by Александр Востриков on 23.04.2022.
//

import Foundation

protocol UserService{
    func userService(loginName: String) -> UserRealm?
}

final class User {
    
    let fullName: String
    var avatar: String
    var status: String
    
    init(fullName: String, avatar: String, status: String){
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }
}
