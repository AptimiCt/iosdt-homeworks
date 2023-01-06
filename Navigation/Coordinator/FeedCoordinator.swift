//
//  FeedCoordinator.swift
//  Navigation
//
//  Created by Александр Востриков on 22.07.2022.
//

import Foundation
import UIKit
import StorageService

class FeedCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    private var navController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func showPostVC(post: Post) {
        let postViewController = PostViewController(post: post)
        postViewController.coordinator = self
        navController.pushViewController(postViewController, animated: true)
    }
    
    func showInfo(){
        let infoVC = InfoViewController()
        infoVC.coordinator = self
        navController.present(infoVC, animated: true, completion: nil)
    }
    
    func showAlert(in controller: UIViewController){
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
        controller.present(alert, animated: true, completion: nil)
    }
}
