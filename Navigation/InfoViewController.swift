//
//  InfoViewController.swift
//  Navigation
//
//  Created by Александр Востриков on 06.12.2021.
//

import UIKit

final class InfoViewController: UIViewController {
    
    weak var coordinator: FeedCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        setupButton()
    }
    
    private func setupButton(){
        let alertButton = UIButton(frame: CGRect(x: self.view.bounds.width / 2 - 100,
                                                 y: self.view.bounds.height / 2 - 25,
                                                 width: 200,
                                                 height: 50))
        alertButton.setTitle("Alert", for: .normal)
        alertButton.setTitleColor(.black, for: .normal)
        alertButton.backgroundColor = .red
        alertButton.layer.cornerRadius = 15
        alertButton.addTarget(self, action: #selector(setupAlert), for: .touchUpInside)
        self.view.addSubview(alertButton)
    }
    
    @objc private func setupAlert(){
        coordinator.showAlert(in: self)
    }
}
