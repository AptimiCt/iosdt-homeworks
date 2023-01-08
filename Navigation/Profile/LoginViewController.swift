//
//  LoginViewController.swift
//  Navigation
//
//  Created by Александр Востриков on 16.01.2022.
//

import UIKit
//MARK: - protocol
protocol LoginViewControllerDelegate: AnyObject {
    func checkerLoginInspector(for password: String, login: String) throws
}

class LoginViewController: UIViewController {
    
    //MARK: - vars
    var delegate: LoginViewControllerDelegate?
    private var timer: Timer?
    private var count = 0
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        
        return activity
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        return imageView
    }()
    
    private let loginTextView: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.backgroundColor = .systemGray6
        textField.placeholder = "Email or iPhone"
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16)
        textField.autocapitalizationType = .none
        return textField
    }()
    
    private let passwordTextView: UITextField = {
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
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.clipsToBounds = true
        return stackView
    }()
    
    private let loginButton: CustomButton = {
        let button = CustomButton(title: Constants.logIn, titleColor: .white)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel"), for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    
    private let choosePasswordButton: CustomButton = {
        let button = CustomButton(title: Constants.choosePassword, titleColor: .white)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel"), for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    
    private let tabBarItemLocal = UITabBarItem(title: "Profile",
                                       image: UIImage(systemName: "person.crop.circle.fill"),
                                       tag: 1)
    
    //MARK: - init
    init(){
        super.init(nibName: nil, bundle: nil)
        self.tabBarItem = tabBarItemLocal
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - override funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        setupView()
        setupConstrains()
        loginButtonTapped()
        choosePasswordButtonTapped()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: - funcs
    private func setupView(){
        scrollView.toAutoLayout()
        contentView.toAutoLayout()
        logoImageView.toAutoLayout()
        stackView.toAutoLayout()
        loginButton.toAutoLayout()
        choosePasswordButton.toAutoLayout()
        passwordTextView.toAutoLayout()
        activityIndicator.toAutoLayout()
        
        view.addSubviews(scrollView)
        view.addSubview(activityIndicator)
        scrollView.addSubviews(contentView)
        scrollView.keyboardDismissMode = .interactive
        
        stackView.addArrangedSubview(loginTextView)
        stackView.addArrangedSubview(passwordTextView)
        contentView.addSubviews(logoImageView, stackView, loginButton, choosePasswordButton)
    }
    
    private func setupConstrains(){
        let constrains = [
            
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor,
                                               constant: Constants.topMarginForLogoImageView),
            logoImageView.heightAnchor.constraint(equalToConstant: Constants.heightForLogoImageView),
            logoImageView.widthAnchor.constraint(equalToConstant: Constants.widthForLogoImageView),
            
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                               constant: Constants.leadingMarginForStackView),
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor,
                                           constant: Constants.topMarginForStackView),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                constant: Constants.trailingMarginForStackView),
            stackView.heightAnchor.constraint(equalToConstant: Constants.heightForStackView),
            
            loginTextView.heightAnchor.constraint(equalToConstant: Constants.heightForStackView / 2),
            passwordTextView.heightAnchor.constraint(equalToConstant: Constants.heightForStackView / 2),
            
            loginButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            loginButton.topAnchor.constraint(equalTo: stackView.bottomAnchor,
                                             constant: Constants.topMarginForLoginButton),
            loginButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: Constants.heightForLoginButton),
            
            choosePasswordButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            choosePasswordButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 16),
            choosePasswordButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            choosePasswordButton.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -16),
            choosePasswordButton.heightAnchor.constraint(equalToConstant: Constants.heightForLoginButton),
            
            activityIndicator.centerXAnchor.constraint(equalTo: passwordTextView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: passwordTextView.centerYAnchor),
            activityIndicator.heightAnchor.constraint(equalTo: passwordTextView.heightAnchor)
        ]
        
        NSLayoutConstraint.activate(constrains)
    }
    
    //MARK: - @objc private funcs
    @objc
    private func keyboardWillShow(notification: NSNotification){
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        
        scrollView.contentInset.bottom = keyboardSize.height
        scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
    }
    
    @objc
    private func keyboardWillHide(notification: NSNotification){
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    @objc
    private func timerCrack(){
        count += 1
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.choosePasswordButton.setTitle("\(String(describing: self.count)) сек.", for: .normal)
        }
    }
    
    //MARK: - private funcs
    private func loginButtonTapped() {
        loginButton.action = { [weak self] in
            guard let self, let passwordText = self.passwordTextView.text, let loginText = self.loginTextView.text else { return }
            #if DEBUG
            let userService = TestUserService()
            self.showPVC(loginName: loginText, userService: userService)
            #else
            do {
                try self.delegate?.checkerLoginInspector(for: passwordText, login: loginText)
                let userService = CurrentUserService()
                self.showPVC(loginName: loginText, userService: userService)
            } catch LoginError.incorrectCredentials {
                self.handle(error: .incorrectCredentials)
            } catch {
                print(error.localizedDescription)
            }
            #endif
        }
    }
    private func showPVC(loginName: String, userService: UserService){
        let profileViewController = ProfileViewController(loginName: loginName, userService: userService)
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    private func handle(error: LoginError) {
        switch error {
            case .incorrectCredentials:
                alertAfterError()
            case .emptyLogin:
                alertAfterError()
            case .emptyPassword:
                alertAfterError()
        }
    }
    private func alertAfterError(){
        let alert = UIAlertController(title: Constants.titleAlert, message: Constants.message, preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(actionOk)
        present(alert, animated: true, completion: nil)
    }
    private func choosePasswordButtonTapped(){
        choosePasswordButton.action = { [weak self] in
            guard let self = self else { return }
            self.passwordTextView.delegate = self
            self.choosePasswordButton.setTitle("\(Constants.choosePassword)", for: .normal)
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timerCrack), userInfo: nil, repeats: true)
            let bruteForceManager = BruteForceManager()
            let passwordText = bruteForceManager.passwordGenerator(lengthPass: 3)
            self.activityIndicator.startAnimating()
            self.passwordTextView.isUserInteractionEnabled = false
            self.choosePasswordButton.isUserInteractionEnabled = false
            DispatchQueue.global().async {
                bruteForceManager.bruteForce(passwordToUnlock: passwordText)
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.passwordTextView.isUserInteractionEnabled = true
                    self.choosePasswordButton.isUserInteractionEnabled = true
                    self.passwordTextView.isSecureTextEntry = false
                    self.passwordTextView.text = passwordText
                    self.timer?.invalidate()
                    self.count = 0
                    self.choosePasswordButton.setTitle("\(Constants.choosePassword)", for: .normal)
                }
            }
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if !passwordTextView.isSecureTextEntry {
            passwordTextView.isSecureTextEntry.toggle()
        }
    }
}
