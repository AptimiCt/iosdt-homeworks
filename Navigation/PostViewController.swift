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
        view.backgroundColor = .blue
        navigationItem.title = "Post"
    }
}
