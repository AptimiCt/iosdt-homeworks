//
//  LoginViewControllerDelegate.swift
//  Navigation
//
//  Created by Александр Востриков on 14.10.2022.
//

import Foundation

protocol LoginViewControllerDelegate: AnyObject {
   
    func checkCredentionals(email: String, password: String, completion: @escaping (Result<AuthModel,NSError>) -> Void )
    func signUp(email: String, password: String, completion: @escaping (Result<AuthModel,NSError>) -> Void )
}
