//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Александр Востриков on 28.11.2021.
//

import UIKit

class ProfileViewController: UIViewController, SetupViewProtocol {

    init(){
        super.init(nibName: nil, bundle: nil)
        self.tabBarItem = tabBarItemLocal
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let tabBarItemLocal = UITabBarItem(title: "Profile",
                                       image: UIImage(systemName: "person.crop.circle.fill"),
                                       tag: 1)
    let profileHeaderView = ProfileHeaderView()
    
    override func viewWillLayoutSubviews() {
        profileHeaderView.frame = view.safeAreaLayoutGuide.layoutFrame
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.backgroundColor =  .lightGray
        self.navigationItem.title = "Profile"
        view.addSubview(profileHeaderView)
        profileHeaderView.setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed(){
        guard let text = profileHeaderView.statusLabel.text else { return }
        print(text)
    }
}
