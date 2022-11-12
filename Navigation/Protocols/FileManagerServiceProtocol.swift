//
//  FileManagerServiceProtocol.swift
//  Navigation
//
//  Created by Александр Востриков on 09.11.2022.
//

import Foundation

protocol FileManagerServiceProtocol {
    func contentsOfDirectory() throws -> [String: String]
    func createFile() throws
    func removeContent() throws
}
