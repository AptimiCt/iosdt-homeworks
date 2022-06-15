//
//  InfoViewController.swift
//  Navigation
//
//  Created by Александр Востриков on 06.12.2021.
//

import UIKit

final class InfoViewController: UIViewController {
    
    private let alertButton = CustomButton(title: Constants.alert , titleColor: .black)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        setupButton()
        setupConstraints()
    }
    
    private func setupButton(){
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        alertButton.backgroundColor = .red
        alertButton.layer.cornerRadius = 15
        self.view.addSubview(alertButton)
        
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
            alertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            alertButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            alertButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            alertButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
