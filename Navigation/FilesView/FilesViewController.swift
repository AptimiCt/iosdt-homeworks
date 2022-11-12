//
//  FilesViewController.swift
//  Navigation
//
//  Created by Александр Востриков on 08.11.2022.
//

import UIKit

final class FilesViewController: UIViewController {
    
    private var contentsDict: [String: String] = [:] {
        didSet{
            files = dictToArray()
            tableView.reloadData()
        }
    }
    private var files: [String] = []
    
    let fileManagerService = FileManagerService()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.toAutoLayout()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.filesRID)
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .lightGray
        tableView.separatorInset = .zero
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        addButtonImagePicker()
        do {
            contentsDict = try fileManagerService.contentsOfDirectory()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    private func setupTableView(){
        tableView.dataSource = self
        view.addSubview(tableView)
        [
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ].forEach { $0.isActive = true }
    }
    
    private func addButtonImagePicker(){
        let leftButtonItem = UIBarButtonItem(barButtonSystemItem: .camera,
                                             target: self,
                                             action: #selector(openImagePicker))
        navigationItem.title = "Documents"
        navigationItem.setRightBarButton(leftButtonItem, animated: true)
    }
    
    @objc private func openImagePicker(){
        
    }
    
    private func dictToArray() -> [String] {
        Array(self.contentsDict.keys).sorted { $0 < $1 }
    }
}

extension FilesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        files.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.filesRID, for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        let file = files[indexPath.row]
        content.text = file
        guard let val = contentsDict[file] else {
            cell.contentConfiguration = content
            return cell }

        cell.accessoryType = val == "NSFileTypeDirectory" ? .disclosureIndicator : .none
        cell.contentConfiguration = content
        return cell
    }
}
