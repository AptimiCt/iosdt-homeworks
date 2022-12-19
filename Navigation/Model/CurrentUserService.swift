//
//  CurrentUserService.swift
//  Navigation
//
//  Created by Александр Востриков on 23.04.2022.
//

import Foundation

final class CurrentUserService: UserService {
    
    let rm = RealmManager()
    private let user: UserRealm?
    
    init() {
        self.user = rm.users.first
    }
    
    func userService(loginName: String) -> UserRealm? {
        if let user = user, loginName == user.login  {
            return user
        }
        return nil
    }
}
