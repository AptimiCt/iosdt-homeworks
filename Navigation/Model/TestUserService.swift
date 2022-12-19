//
//  TestUserService.swift
//  Navigation
//
//  Created by Александр Востриков on 25.04.2022.
//

import Foundation

final class TestUserService: UserService {
    func userService(loginName: String) -> UserRealm? {
        let user = UserRealm(login: "Мастер Чиф", password: "")        
        return user
    }
}
