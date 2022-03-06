//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Александр Востриков on 28.11.2021.
//

import UIKit

class ProfileViewController: UIViewController, SetupViewProtocol {
    
    let tabBarItemLocal = UITabBarItem(title: "Profile",
                                       image: UIImage(systemName: "person.crop.circle.fill"),
                                       tag: 1)
    let profileTableHeaderView = ProfileHeaderView()
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.toAutoLayout()
        return tableView
    }()
    
    let cellForPost = String(describing: PostTableViewCell.self)
    
    var localStorage:[Post] = []
    
    init(){
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
        self.tabBarItem = tabBarItemLocal
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        localStorage = Storage.posts
        setupView()
    }
    
    func setupView() {
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        configureConstraints()
    }
    
    func configureConstraints(){
        view.addSubview(tableView)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: cellForPost)
        let constraints: [NSLayoutConstraint] = [
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        localStorage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellForPost, for: indexPath) as! PostTableViewCell
        cell.post = localStorage[indexPath.row]
        return cell
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let profileTableHeaderView = ProfileHeaderView(frame: .zero)
        profileTableHeaderView.delegate = self
        return profileTableHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        Constants.heightForProfileHeaderView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.selectionStyle = .none
    }
}

extension ProfileViewController: ProfileHeaderViewDelegate {
    func didTapedButton() {
        guard let status = self.profileTableHeaderView.statusLabel.text else { return }
        print("\(status)")
    }
}
