//
//  LoginError.swift
//  Navigation
//
//  Created by Александр Востриков on 21.09.2022.
//

import Foundation

enum LoginError: Error {
    case incorrectCredentials
    case emptyLogin
    case emptyPassword
}
