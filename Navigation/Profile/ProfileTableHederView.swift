//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Александр Востриков on 16.12.2021.
//

import UIKit

class ProfileHeaderView: UIView {
    
    
    //MARK: - vars
    var heightAvatar: NSLayoutConstraint?
    var widthAvatar: NSLayoutConstraint?
    var leadingAvatar: NSLayoutConstraint?
    var topAvatar: NSLayoutConstraint?
    var trailingAvatar: NSLayoutConstraint?
    var bottomAvatar: NSLayoutConstraint?
    var closeButtonTopAnchor: NSLayoutConstraint?
    
    weak var delegate: ProfileHeaderViewDelegate?
    
    let avatarImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "avatar"))
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    let setStatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.red, for: .highlighted)
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
    
    lazy var backgroundView: UIView = {
        let backgroundView = UIView(frame: UIScreen.main.bounds)
        backgroundView.alpha = 0
        backgroundView.backgroundColor = .black
        
        backgroundView.toAutoLayout()
        return backgroundView
    }()
    
    lazy var closeButton: UIButton = {
        let closeButton = UIButton()
        closeButton.alpha = 0
        closeButton.tintColor = .red
        closeButton.setBackgroundImage(UIImage(systemName: "xmark.circle"), for: .normal)
        closeButton.toAutoLayout()
        return closeButton
    }()
    
    //MARK: - funcs
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews(fullNameLabel, statusLabel, setStatusButton, backgroundView, closeButton, avatarImageView)
        constraintForBackground()
        constraintsForCloseButton()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapedStatusButton(){
        self.delegate?.didTapedButton()
    }
}

//MARK: - extension
extension ProfileHeaderView{
    
    fileprivate func constraintForBackground() {
        backgroundView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        backgroundView.widthAnchor.constraint(equalToConstant: Constants.screenWeight).isActive = true
        backgroundView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
    }
    
    fileprivate func constraintsForCloseButton() {
        closeButtonTopAnchor = closeButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8)
        closeButtonTopAnchor?.isActive = true
        closeButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -8).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    func configureConstraints(){
        
        avatarImageView.toAutoLayout()
        fullNameLabel.toAutoLayout()
        statusLabel.toAutoLayout()
        setStatusButton.toAutoLayout()
        
        setStatusButton.addTarget(self, action: #selector(didTapedStatusButton), for: .touchUpInside)
        
        leadingAvatar = avatarImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                                                 constant: Constants.leadingMarginForAvatarImageView)
        topAvatar = avatarImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
                                             constant: Constants.topMarginForAvatarImageView)
        trailingAvatar = avatarImageView.trailingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor,
                                               constant: Constants.leadingMarginForFullNameLabel)
        bottomAvatar = avatarImageView.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor,
                                             constant: -Constants.topMarginForSetStatusButton)
        widthAvatar = avatarImageView.widthAnchor.constraint(equalToConstant: Constants.widthForAvatarImageView)
        heightAvatar = avatarImageView.heightAnchor.constraint(equalToConstant: Constants.heightForAvatarImageView)
        
        let constraints: [NSLayoutConstraint] = [
            leadingAvatar, topAvatar, trailingAvatar, bottomAvatar, heightAvatar, widthAvatar,
    
            fullNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
                                               constant: Constants.topMarginForFullNameLabel),
            fullNameLabel.trailingAnchor.constraint(greaterThanOrEqualTo: self.safeAreaLayoutGuide.trailingAnchor,
                                                    constant: Constants.trailingMarginForFullNameLabel),
            
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
            
        ].compactMap { $0 }
        
        NSLayoutConstraint.activate(constraints)
    }
}

protocol ProfileHeaderViewDelegate: AnyObject {
    func didTapedButton()
}
