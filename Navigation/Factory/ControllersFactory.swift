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

final class ControllersFactory {
    
    let controller: UINavigationController
    
    private let tab: Tab
    
    init(navigationController: UINavigationController, tab: Tab){
        self.controller = navigationController
        self.tab = tab
        createTabBarViewController()
    }
    
    private func createTabBarViewController(){
        switch tab {
            case .feed:
                let feedCoordinator = FeedCoordinator(navController: controller)
                let feedViewController = FeedViewController(coordinator: feedCoordinator)
                controller.setViewControllers([feedViewController], animated: true)
            case .login:
                let loginCoordinator = LoginCoordinator(navController: controller)
                let currentLoginFactory = CurrentLoginFactory()
                let loginViewController = LoginViewController(coordinator: loginCoordinator, delegate: currentLoginFactory.create())
                controller.setViewControllers([loginViewController], animated: true)
        }
    }
    
    static func createProfileViewController(loginName: String, userService: UserService, coordinator: LoginCoordinator) -> UIViewController {
        let posts = Storage.posts
        let viewModel = ProfileViewModel(posts: posts)
        let profileViewController = ProfileViewController(
            loginName: loginName,
            userService: userService,
            coordinator: coordinator,
            viewModel: viewModel
        )
        return profileViewController
    }
    
    static func createTabBarController() -> TabBarController {
        return TabBarController()
    }
}
