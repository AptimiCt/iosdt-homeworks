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
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.toAutoLayout()
        return tableView
    }()
    
    var localStorage:[Post] = []
    var photos: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        localStorage = Storage.posts
        photos = Photos.fetchPhotos()
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
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: Cells.cellForPost)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: Cells.cellForSection)
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
        section == 0 ? 1 : localStorage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Cells.cellForSection,
                                                     for: indexPath) as! PhotosTableViewCell
            cell.photos = photos
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.cellForPost) as! PostTableViewCell
        cell.post = localStorage[indexPath.row]
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let profileTableHederView = ProfileHeaderView(frame: .zero)
            profileTableHederView.delegate = self
            return profileTableHederView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? Constants.heightForProfileHeaderView : 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.selectionStyle = .none
        if indexPath.section == 0 {
            let nvc = PhotosViewController()
            navigationController?.pushViewController(nvc, animated: true)
        }
    }
}

extension ProfileViewController: ProfileHeaderViewDelegate {
    func didTapedButton() {
        guard let status = self.profileTableHederView.statusLabel.text else { return }
        print("\(status)")
    }
}
