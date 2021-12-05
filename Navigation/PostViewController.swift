//
//  PostViewController.swift
//  Navigation
//
//  Created by Александр Востриков on 06.12.2021.
//

import UIKit

class PostViewController: UIViewController, SetupViewProtocol {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        let leftButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                             target: self,
                                             action: #selector(openInfoVC))
        view.backgroundColor = .blue
        navigationItem.title = "Post"
        navigationItem.setRightBarButton(leftButtonItem, animated: true)
    }

    @objc func openInfoVC(){
        print(#function)
    }
}
