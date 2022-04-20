//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Александр Востриков on 16.12.2021.
//

import UIKit
import SnapKit

class ProfileHeaderView: UIView {
    
    
    //MARK: - vars
    
    var closeButtonTopAnchor: Constraint? = nil
    
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
    
    private let setStatusButton: UIButton = {
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
    
    private let fullNameLabel: UILabel = {
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
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews(fullNameLabel, statusLabel, setStatusButton, backgroundView, closeButton, avatarImageView)
        setStatusButton.addTarget(self, action: #selector(didTapedStatusButton), for: .touchUpInside)
        snpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - @objc private func
    @objc private func didTapedStatusButton(){
        self.delegate?.didTapedButton()
    }
}

//MARK: - extension
extension ProfileHeaderView{
    
    fileprivate func snpConstraints() {
        
        backgroundView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.height)
        }
        closeButton.snp.makeConstraints { make in
            self.closeButtonTopAnchor = make.top.equalTo(backgroundView.snp.top).offset(8).constraint
            make.trailing.equalTo(self.backgroundView.snp.trailing).offset(-8)
            make.width.height.equalTo(35)
        }
        avatarImageView.snp.makeConstraints { make in
            make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(Constants.leadingMarginForAvatarImageView)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(Constants.topMarginForAvatarImageView)
            make.trailing.equalTo(fullNameLabel.snp.leading).offset(Constants.leadingMarginForFullNameLabel)
            make.bottom.equalTo(setStatusButton.snp.top).offset(-Constants.topMarginForSetStatusButton)
            make.width.height.equalTo(Constants.heightForAvatarImageView)
        }
        fullNameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(Constants.topMarginForFullNameLabel)
            make.trailing.greaterThanOrEqualTo(self.safeAreaLayoutGuide.snp.trailing).offset(Constants.trailingMarginForFullNameLabel)
        }
        statusLabel.snp.makeConstraints { make in
            make.leading.equalTo(fullNameLabel.snp.leading)
            make.trailing.equalTo(fullNameLabel.snp.trailing)
            make.bottom.equalTo(setStatusButton.snp.top).offset(Constants.bottomMarginForStatusLabel)
        }
        setStatusButton.snp.makeConstraints { make in
            make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(Constants.leadingMarginForSetStatusButton)
            make.top.equalTo(avatarImageView.snp.bottom).offset(Constants.topMarginForSetStatusButton)
            make.trailing.greaterThanOrEqualTo(self.safeAreaLayoutGuide.snp.trailing).offset(Constants.trailingMarginForSetStatusButton)
            make.height.equalTo(Constants.heightForSetStatusButton)
        }
    }
}

protocol ProfileHeaderViewDelegate: AnyObject {
    func didTapedButton()
}
