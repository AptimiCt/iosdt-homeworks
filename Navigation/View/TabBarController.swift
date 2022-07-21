//
//  TabBarController.swift
//  Navigation
//
//  Created by Александр Востриков on 21.07.2022.
//

import UIKit

class TabBarController: UITabBarController {
    private var feedViewController: UIViewController
    private var loginViewController: UIViewController
    
    init() {
        self.feedViewController = ViewControllersFactory(navigationController: UINavigationController(), tab: .feed).navigationController
        self.loginViewController = ViewControllersFactory(navigationController: UINavigationController(), tab: .login).navigationController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setControllers()
    }
    
    
    private func setControllers() {
        viewControllers = [
            feedViewController,
            loginViewController
        ]
        selectedIndex = 1
    }
    
}
