//
//  PostViewController.swift
//  Navigation
//
//  Created by Александр Востриков on 06.12.2021.
//

import UIKit

class PostViewController: UIViewController, SetupViewProtocol {
    
    var post: Post?
    
    init(post: Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        let leftButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                             target: self,
                                             action: #selector(openInfoVC))
        view.backgroundColor = .blue
        navigationItem.title = post?.author
        navigationItem.setRightBarButton(leftButtonItem, animated: true)
    }
    
    @objc func openInfoVC(){
        let infoVC = InfoViewController()
        present(infoVC, animated: true, completion: nil)
    }
}
