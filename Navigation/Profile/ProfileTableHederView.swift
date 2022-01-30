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
        addSubviews(avatarImageView, fullNameLabel, statusLabel, setStatusButton)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    weak var delegate: ProfileHeaderViewDelegate?
    
    let avatarImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "avatar"))
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let setStatusButton: UIButton = {
    let button = UIButton()
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
    
    let fullNameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Avatar"
        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        nameLabel.textColor = .black
        return nameLabel
    }()
        
    let statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.text = "Waiting for something..."
        statusLabel.font = .systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray
        return statusLabel
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    @objc func didTapedStatusButton(){
        self.delegate?.didTapedButton()
    }
}
extension ProfileHeaderView{
    func configureConstraints(){
            
            avatarImageView.toAutoLayout()
            stackView.toAutoLayout()
            fullNameLabel.toAutoLayout()
            statusLabel.toAutoLayout()
            setStatusButton.toAutoLayout()
            setStatusButton.addTarget(self, action: #selector(didTapedStatusButton), for: .touchUpInside)
        
            let constraints: [NSLayoutConstraint] = [
                avatarImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                                                         constant: Constants.leadingMarginForAvatarImageView),
                avatarImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
                                                     constant: Constants.topMarginForAvatarImageView),
                avatarImageView.widthAnchor.constraint(equalToConstant: Constants.widthForAvatarImageView),
                avatarImageView.heightAnchor.constraint(equalToConstant: Constants.heightForAvatarImageView),
                
                fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor,
                                                       constant: Constants.leadingMarginForfullNameLabel),
                fullNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
                                                   constant: Constants.topMarginForfullNameLabel),
                fullNameLabel.trailingAnchor.constraint(greaterThanOrEqualTo: self.safeAreaLayoutGuide.trailingAnchor,
                                                        constant: Constants.trailingMarginForfullNameLabel),
                
                statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
                statusLabel.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor),
                statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor,
                                                    constant: Constants.bottomMarginForStatusLabel),
                
                setStatusButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                                                         constant: Constants.leadingMarginForSetStatusButton),
                setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor,
                                                     constant: Constants.topMarginForSetStatusButton),
                setStatusButton.trailingAnchor.constraint(greaterThanOrEqualTo: self.safeAreaLayoutGuide.trailingAnchor,
                                                          constant: Constants.trailingMarginForSetStatusButton),
                setStatusButton.heightAnchor.constraint(equalToConstant: Constants.heightForSetStatusButton)
            ]
            NSLayoutConstraint.activate(constraints)
            
            self.setNeedsLayout()
            self.layoutIfNeeded()
        }
}

public extension UIView {
    
    func toAutoLayout(){
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addSubviews(_ subviews: UIView...){
        subviews.forEach { addSubview($0)}
    }
}

protocol ProfileHeaderViewDelegate: AnyObject {
    func didTapedButton()
}
