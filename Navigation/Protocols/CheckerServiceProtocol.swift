//
//  CheckerServiceProtocol.swift
//  Navigation
//
//  Created by Александр Востриков on 05.10.2022.
//

import Foundation
import FirebaseAuth

protocol CheckerServiceProtocol {
    func checkCredentials(email: String, password: String, completion: @escaping (AuthDataResult?, NSError?) -> Void)
    func signUp(email: String, password: String, completion: @escaping (AuthDataResult?, NSError?) -> Void)
}
