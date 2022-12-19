//
//  FileManagerService.swift
//  Navigation
//
//  Created by Александр Востриков on 16.12.2022.
//

import UIKit

class FileManagerService {
    
    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    
    func read(for path: String) -> Data? {
        let data = try? Data(contentsOf: self.path.appendingPathComponent(path))
        return data
    }
    
    func createFile(url: URL, name: String){
        
        let fileUrl = path.appendingPathComponent(name, conformingTo: .image)
        
        try? FileManager.default.copyItem(at: url, to: fileUrl)
    }
}
