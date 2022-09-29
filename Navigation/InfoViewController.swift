//
//  InfoViewController.swift
//  Navigation
//
//  Created by Александр Востриков on 06.12.2021.
//

import UIKit

final class InfoViewController: UIViewController {
    
    private let alertButton = CustomButton(title: Constants.alert , titleColor: .black)
    private let firstLabel: UILabel = {
        let firstLabel = UILabel()
        firstLabel.backgroundColor = .green
        firstLabel.layer.cornerRadius = 15
        firstLabel.clipsToBounds = true
        firstLabel.numberOfLines = 0
        firstLabel.textAlignment = .center
        return firstLabel
    }()
    private let planetLabel: UILabel = {
        let planetLabel = UILabel()
        planetLabel.backgroundColor = .orange
        planetLabel.layer.cornerRadius = 15
        planetLabel.clipsToBounds = true
        planetLabel.numberOfLines = 0
        planetLabel.textAlignment = .center
        return planetLabel
    }()
    private var firstUrl = "https://jsonplaceholder.typicode.com/todos/21"
    private var planetUrl = "https://swapi.dev/api/planets/1"
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        setupView()
        setupConstraints()
        openFirst(with: firstUrl)
        openSecond(with: planetUrl)
    }
    
    private func setupView(){
        alertButton.toAutoLayout()
        firstLabel.toAutoLayout()
        planetLabel.toAutoLayout()
        alertButton.backgroundColor = .red
        alertButton.layer.cornerRadius = 15
        
        self.view.addSubviews(alertButton, firstLabel, planetLabel)
        
        alertButton.action = { [weak self] in
            let title = "Уведомление!"
            let message = "Нажата кнопка в InfoViewController"
            let alert = UIAlertController(title: title,
                                          message: message,
                                          preferredStyle: .alert)
            let actionCancel = UIAlertAction(title: "Cancel", style: .destructive) { _ in
                print("Нажата кнопка Cancel")
            }
            let actionOk = UIAlertAction(title: "Ok", style: .default) { _ in
                print("Нажата кнопка Ок")
            }
            alert.addAction(actionCancel)
            alert.addAction(actionOk)
            self?.present(alert, animated: true, completion: nil)
        }
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            alertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            alertButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            alertButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            alertButton.heightAnchor.constraint(equalToConstant: 40),
            
            firstLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstLabel.leadingAnchor.constraint(equalTo: alertButton.leadingAnchor),
            firstLabel.topAnchor.constraint(equalTo: alertButton.bottomAnchor, constant: 20),
            firstLabel.trailingAnchor.constraint(equalTo: alertButton.trailingAnchor),
            firstLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 40),
            
            planetLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            planetLabel.leadingAnchor.constraint(equalTo: alertButton.leadingAnchor),
            planetLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 20),
            planetLabel.trailingAnchor.constraint(equalTo: alertButton.trailingAnchor),
            planetLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 40),
        ])
    }
    
    private func openFirst(with stringUrl: String){
        guard let url = URL(string: stringUrl) else { return }
        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            if let data = data {
                do {
                    let serializationDict = try JSONSerialization.jsonObject(with: data, options: [])
                    if let dict = serializationDict as? [String: Any], let title = dict["title"] as? String {
                        DispatchQueue.main.async {
                            self?.firstLabel.text = title
                        }
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    private func openSecond(with stringUrl: String){
        guard let url = URL(string: stringUrl) else { return }
        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            if let data = data {
                do {
                    let serializationDict = try JSONDecoder().decode(Planets.self, from: data)
                    DispatchQueue.main.async {
                        self?.planetLabel.text = serializationDict.orbitalPeriod
                    }
                    print(serializationDict)
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}
