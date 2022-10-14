//
//  CheckerService.swift
//  Navigation
//
//  Created by Александр Востриков on 25.04.2022.
//

import Foundation
import FirebaseAuth

class CheckerService: CheckerServiceProtocol {
    
    static let shared = CheckerService()
    
    private let login = Constants.login
    private let password = Constants.password
    
    private init () {}
    
    
    func checkCredentials(email: String, password: String, completion: @escaping (AuthDataResult?, NSError?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            print("\(result)")
            print("\(error?.localizedDescription)")
        }
        
        
        
//        if self.login == login.hash && self.password == pass.hash {
//            return true
//        }
//        return false
    }
    
    func signUp(email: String, password: String, completion: @escaping (AuthDataResult?, NSError?) -> Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { createResult, error in
            print("\(createResult)")
            print("\(error?.localizedDescription)")
        }
    }
    
//    func checkCredentials(for pass: String, login: String ) -> Bool {
//        Auth.auth().signIn(withEmail: login, password: pass) { result, error in
//            //result?.user ==
//        }
//
//
//
//        if self.login == login.hash && self.password == pass.hash {
//            return true
//        }
//        return false
//    }
//
//    func signUp(for pass: String, login: String) {
//
//    }
}
