//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Александр Востриков on 16.12.2021.
//

import UIKit
    
class ProfileHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(avatarImageView)
        addSubview(stackView)
        stackView.addSubview(nameLabel)
        stackView.addSubview(statusLabel)
        addSubview(statusButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let  avatarImageView: UIImageView = { let imageView = UIImageView(image: UIImage(named: "avatar"))
        imageView.frame = CGRect(x: 16, y: 16, width: 100, height: 100)
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = CGColor(red: 100, green: 2, blue: 24, alpha: 1)
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let statusButton: UIButton = { let button = UIButton()
        button.frame = CGRect(x: 16, y: 132, width: 358, height: 50)
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        
        button.layer.cornerRadius = 4
        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.layer.shadowOffset.width = 4
        button.layer.shadowOffset.height = 4
        
        return button
    }()
    
    let nameLabel: UILabel = { let nameLabel = UILabel()
        nameLabel.text = "Avatar"
        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        nameLabel.textColor = .black
        nameLabel.frame = CGRect(x: 41, y: 0, width: 100, height: 30)
        return nameLabel
    }()
        
    let statusLabel: UILabel = { let statusLabel = UILabel()
        statusLabel.text = "Waiting for something..."
        statusLabel.font = .systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray
        statusLabel.frame = CGRect(x: 41, y: 51, width: 200, height: 30)
        return statusLabel
    }()
    
    let stackView: UIStackView = { let stackView = UIStackView()
        stackView.frame.origin = CGPoint(x: 91, y: 27)
        return stackView
    }()
}
