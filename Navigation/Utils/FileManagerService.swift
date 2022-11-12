//
//  FileManagerService.swift
//  Navigation
//
//  Created by Александр Востриков on 09.11.2022.
//

import Foundation

final class FileManagerService: FileManagerServiceProtocol {
    
    private let managerService = FileManager.default

    func contentsOfDirectory() throws -> [String: String] {
        let documentsUrl = try managerService.url(for: .documentDirectory,
                                                in: .userDomainMask,
                                                appropriateFor: nil,
                                                create: false)
        let contentsOfDirectory = try managerService.contentsOfDirectory(at: documentsUrl,
                                                              includingPropertiesForKeys: nil,
                                                              options: [.skipsHiddenFiles])
        let contents = try urlToStringDict(urls: contentsOfDirectory)

        return contents
    }
    
    func createFile() {
        
    }
    
    func removeContent() {
        
    }
    
    private func urlToStringDict(urls: [URL]) throws -> [String: String] {
        var contents: [String: String] = [:]
        for url in urls {
            let attributes = try managerService.attributesOfItem(atPath: url.path)
            let typeAttributes = attributes[.type] as? String
            contents[url.lastPathComponent] = typeAttributes
        }
        return contents
    }
}
