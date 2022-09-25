//
//  NetworkManager.swift
//  Navigation
//
//  Created by Александр Востриков on 25.09.2022.
//

import Foundation
struct NetworkManager {
    static func request(for configuration: AppConfiguration) {
        switch configuration {
            case .people(let urlString):
                guard let url = URL(string: urlString) else { return }
                dataTask(url)
            case .starships(let urlString):
                if let url = URL(string: urlString){
                    dataTask(url)
                }
            case .planets(let urlString):
                if let url = URL(string: urlString){
                    dataTask(url)
                }
                
        }
        func dataTask(_ url: URL){
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    print("A: \(String(data: data, encoding: .utf8) ?? "")")
                }
                if let response = response as? HTTPURLResponse {
                    print("B: allHeaderFields: \(response.allHeaderFields); \nstatusCode: \(response.statusCode)")
                } else {
                    print("C: \(String(describing: error?.localizedDescription))")
                    //The Internet connection appears to be offline.
                }
            }.resume()
        }
    }
}

enum AppConfiguration {
    case people(String)
    case starships(String)
    case planets(String)
}
