//
//  LoginInspector.swift
//  Navigation
//
//  Created by Александр Востриков on 25.04.2022.
//

import Foundation

class LoginInspector: LoginViewControllerDelegate {

    func checkCredentionals(email: String, password: String, completion: @escaping (Result<AuthModel,NSError>) -> Void) {
        CheckerService.shared.checkCredentials(email: email, password: password) { model, error in
            print("checkCredentials:\(model?.user.uid) - \(error?.localizedDescription)")
        }
    }
    
    func signUp(email: String, password: String, completion: @escaping (Result<AuthModel, NSError>) -> Void) {
        CheckerService.shared.signUp(email: email, password: password) { result, error in
            print("signUp:\(result?.user.uid) - \(error?.localizedDescription)")
        }
    }
}
