//
//  CurrentLoginFactory.swift
//  Navigation
//
//  Created by Александр Востриков on 28.04.2022.
//

import Foundation

final class CurrentLoginFactory: LoginFactory{
    func create() -> LoginInspector {
        return LoginInspector()
    }
}
