//
//  ViewControllersFactory.swift
//  Navigation
//
//  Created by Александр Востриков on 21.07.2022.
//

import UIKit
enum Tab {
    case feed
    case login
}

final class ViewControllersFactory {
    
    let navigationController: UINavigationController
    private let tab: Tab
    
    init(navigationController: UINavigationController, tab: Tab){
        self.navigationController = navigationController
        self.tab = tab
        createTabBarController()
    }
    
    func createTabBarController(){
        switch tab {
            case .feed:
                let feedViewController = FeedViewController()
                navigationController.setViewControllers([feedViewController], animated: true)
            case .login:
                let loginViewController = LoginViewController()
                let currentLoginFactory = CurrentLoginFactory()
                loginViewController.delegate = currentLoginFactory.create()
                navigationController.setViewControllers([loginViewController], animated: true)
        }
    }
}
