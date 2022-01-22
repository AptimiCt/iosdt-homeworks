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
        view.backgroundColor = .white
        self.tabBarItem = tabBarItemLocal
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let tabBarItemLocal = UITabBarItem(title: "Profile",
                                       image: UIImage(systemName: "person.crop.circle.fill"),
                                       tag: 1)
    let profileTableHederView = ProfileHeaderView()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.toAutoLayout()
        return tableView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        //configureConstraints()
    }
    
    func configureConstraints(){
        view.addSubview(tableView)
        profileTableHederView.toAutoLayout()
    
        let constraints: [NSLayoutConstraint] = [
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
    }
}
