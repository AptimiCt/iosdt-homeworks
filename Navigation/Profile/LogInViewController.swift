//
//  LogInViewController.swift
//  Navigation
//
//  Created by Александр Востриков on 16.01.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    init(){
        super.init(nibName: nil, bundle: nil)
        self.tabBarItem = tabBarItemLocal
    }
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        return imageView
    }()
    
    let loginTextView: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.backgroundColor = .systemGray6
        textField.placeholder = "Email or iphone"
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16)
        textField.autocapitalizationType = .none
        return textField
    }()
    
    let passwordTextView: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.placeholder = "Password"
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16)
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.clipsToBounds = true
        return stackView
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.textColor = .white
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel"), for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let tabBarItemLocal = UITabBarItem(title: "Profile",
                                       image: UIImage(systemName: "person.crop.circle.fill"),
                                       tag: 1)
    
    override func viewDidLoad() {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        setupView()
        setupConstrains()
    }
    
    func setupView(){
        logoImageView.toAutoLayout()
        stackView.toAutoLayout()
        loginButton.toAutoLayout()
        passwordTextView.toAutoLayout()
        
        stackView.addArrangedSubview(loginTextView)
        stackView.addArrangedSubview(passwordTextView)
        view.addSubviews(logoImageView, stackView, loginButton)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    func setupConstrains(){
        let constrains = [
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                               constant: Constants.topMarginForLogoImageView),
            logoImageView.heightAnchor.constraint(equalToConstant: Constants.heightForLogoImageView),
            logoImageView.widthAnchor.constraint(equalToConstant: Constants.widthForLogoImageView),
            
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                               constant: Constants.leadingMarginForStackView),
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor,
                                           constant: Constants.topMarginForStackView),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                constant: Constants.trailingMarginForStackView),
            stackView.heightAnchor.constraint(equalToConstant: Constants.heightForStackView),
            
            loginTextView.heightAnchor.constraint(equalToConstant: Constants.heightForStackView / 2),
            passwordTextView.heightAnchor.constraint(equalToConstant: Constants.heightForStackView / 2),
            
            loginButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            loginButton.topAnchor.constraint(equalTo: stackView.bottomAnchor,
                                             constant: Constants.topMarginForLoginButton),
            loginButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: Constants.heightForLoginButton)
            
        ]
        
        NSLayoutConstraint.activate(constrains)
    }
    
    @objc func loginButtonTapped(){
        
    }
}
