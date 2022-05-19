//
//  LoginFactory.swift
//  Navigation
//
//  Created by Александр Востриков on 27.04.2022.
//

import Foundation

protocol LoginFactory {
    func create() -> LoginInspector
}
