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
        return firstLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        setupView()
        setupConstraints()
    }
    
    private func setupView(){
        alertButton.toAutoLayout()
        firstLabel.toAutoLayout()
        alertButton.backgroundColor = .red
        alertButton.layer.cornerRadius = 15
        
        self.view.addSubviews(alertButton, firstLabel)
        
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
            firstLabel.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
