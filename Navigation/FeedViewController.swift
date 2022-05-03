//
//  FeedViewController.swift
//  Navigation
//
//  Created by Александр Востриков on 28.11.2021.
//

import UIKit
import StorageService

class FeedViewController: UIViewController, SetupViewProtocol {
    
    let post = Post(author: "Post", description: "Post", image: "bars", likes: 1, views: 1)
    let tabBarItemLocal = UITabBarItem(title: "Feed",
                                       image: UIImage(systemName: "f.circle.fill"),
                                       tag: 0)
    
    let buttonToPostFirst = UIButton()
    let buttonToPostSecond = UIButton()
    
    let stackView = UIStackView()
    
    init(){
        super.init(nibName: nil, bundle: nil)
        self.tabBarItem = tabBarItemLocal
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupButtons()
        setupStack()
        setupConstraints()
    }
    
    func setupView() {
        view.backgroundColor =  .green
        self.navigationItem.title = "Feed"
    }
    
    func setupButtons(){
        buttonToPostFirst.toAutoLayout()
        buttonToPostSecond.toAutoLayout()
        buttonToPostFirst.backgroundColor = .red
        buttonToPostFirst.layer.cornerRadius = 10
        buttonToPostFirst.setTitle("First button", for: .normal)
        buttonToPostFirst.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        
        buttonToPostSecond.backgroundColor = .blue
        buttonToPostSecond.layer.cornerRadius = 10
        buttonToPostSecond.setTitle("Second button", for: .normal)
        buttonToPostSecond.addTarget(self, action: #selector(pressed), for: .touchUpInside)
    }
    
    func setupStack(){
        stackView.toAutoLayout()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.addArrangedSubview(buttonToPostFirst)
        stackView.addArrangedSubview(buttonToPostSecond)
        view.addSubview(stackView)
    }
    
    func setupConstraints(){
        let constraints = [
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func pressed(){
        let postViewController = PostViewController(post: post)
        navigationController?.pushViewController(postViewController, animated: true)
    }
}
