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
    
    let tabBarItemLocal = UITabBarItem(title: "Feed",
                                   image: UIImage(systemName: "f.circle.fill"),
                                   tag: 0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.backgroundColor =  .green
        self.navigationItem.title = "Feed"
    }
}
