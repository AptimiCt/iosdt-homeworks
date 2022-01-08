//
//  FeedViewController.swift
//  Navigation
//
//  Created by Александр Востриков on 28.11.2021.
//

import UIKit

class FeedViewController: UIViewController, SetupViewProtocol {
    
    init(){
        super.init(nibName: nil, bundle: nil)
        self.tabBarItem = tabBarItemLocal
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let post = Post(title: "New Post")
    let tabBarItemLocal = UITabBarItem(title: "Feed",
                                   image: UIImage(systemName: "f.circle.fill"),
                                   tag: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupButton()
    }
    
    func setupView() {
        view.backgroundColor =  .green
        self.navigationItem.title = "Feed"
    }
    
    func setupButton(){
        let buttonToPost = UIButton(frame: CGRect(x: self.view.frame.width / 2 - 100,
                                                  y: self.view.frame.height / 2 - 25,
                                                  width: 200,
                                                  height: 50))
        buttonToPost.backgroundColor = .red
        buttonToPost.layer.cornerRadius = 10
        buttonToPost.setTitle("post", for: .normal)
        buttonToPost.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        view.addSubview(buttonToPost)
    }
    
    @objc func pressed(){
        let postViewController = PostViewController(post: post)
        navigationController?.pushViewController(postViewController, animated: true)
    }
}
