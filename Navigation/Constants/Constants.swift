//
//  Constants.swift
//  Navigation
//
//  Created by Александр Востриков on 15.01.2022.
//

import UIKit

struct Constants {
    //MARK: - Constants for ProfileTableHederView
    static let screenWeight = UIScreen.main.bounds.width
    
    //MARK: - Constants for PostTableViewCell
    //MARK: - for authorLabel
    static let leadingMarginForAuthorLabel: CGFloat = 16
    static let topMarginForAuthorLabel: CGFloat = 16
    static let trailingMarginForAuthorLabel: CGFloat = -16
    static let bottomForAuthorLabel: CGFloat = -16
    
    //MARK: - for descriptionLabel
    static let leadingMarginForDescriptionLabel: CGFloat = 16
    static let topMarginForDescriptionLabel: CGFloat = 16
    static let trailingMarginForDescriptionLabel: CGFloat = -16
    static let bottomForDescriptionLabel: CGFloat = -16
    
    //MARK: - for likesLabel
    static let leadingMarginForLikesLabel: CGFloat = 16
    static let trailingMarginForLikesLabel: CGFloat = -16
    static let bottomForLikesLabel: CGFloat = -16
    
    //MARK: - for viewsLabel
    static let topMarginForViewsLabel: CGFloat = 16
    static let trailingMarginForViewsLabel: CGFloat = -16
    static let bottomForViewsLabel: CGFloat = -16
    
    //MARK: - for AvatarImageView
    static let leadingMarginForAvatarImageView: CGFloat = 16
    static let topMarginForAvatarImageView: CGFloat = 16
    static let heightForAvatarImageView: CGFloat = 100
    static let widthForAvatarImageView: CGFloat = 100
    
    //MARK: - for fullNameLabel
    static let leadingMarginForFullNameLabel: CGFloat = -20
    static let topMarginForFullNameLabel: CGFloat = 27
    static let trailingMarginForFullNameLabel: CGFloat = 16
    
    //MARK: - for statusLabel
    static let bottomMarginForStatusLabel: CGFloat = -34
    
    //MARK: - for setStatusButton
    static let leadingMarginForSetStatusButton: CGFloat = 16
    static let topMarginForSetStatusButton: CGFloat = 16
    static let trailingMarginForSetStatusButton: CGFloat = -16
    static let heightForSetStatusButton: CGFloat = 50
    
    //MARK: - Constants for ProfileViewController
    //MARK: - for profileHeaderView
    static let heightForProfileHeaderView: CGFloat = 220
    
    
    //MARK: - Constants for LoginViewController
    //MARK: - for logoImageView
    
    static let topMarginForLogoImageView: CGFloat = 120
    static let heightForLogoImageView: CGFloat = 100
    static let widthForLogoImageView: CGFloat = 100
    
    //MARK: - for stackView
    static let leadingMarginForStackView: CGFloat = 16
    static let topMarginForStackView: CGFloat = 120
    static let trailingMarginForStackView: CGFloat = -16
    static let heightForStackView: CGFloat = 100
    
    //MARK: - for loginButton
    static let topMarginForLoginButton: CGFloat = 16
    static let heightForLoginButton: CGFloat = 50
    
    //MARK: - Constants for PhotosTableViewCell
    //MARK: - for photosLabel
    static let leadingMarginForPhotosLabel: CGFloat = 12
    static let topMarginForPhotosLabel: CGFloat = 12
    
    //MARK: - for arrowButton
    static let topMarginForArrowButton: CGFloat = 12
    static let trailingMarginForArrowButton: CGFloat = -12
    
    //MARK: - for firstPhoto
    static let leadingMarginForFirstPhoto: CGFloat = 12
    static let topMarginForFirstPhoto: CGFloat = 12
    static let trailingMarginForFirstPhoto: CGFloat = -8
    static let bottomForFirstPhoto: CGFloat = -12
    
    //MARK: - for secondPhoto
    static let trailingMarginForSecondPhoto: CGFloat = -8
    static let bottomForSecondPhoto: CGFloat = -12
    
    //MARK: - for thirdPhoto
    static let trailingMarginForThirdPhoto: CGFloat = -8
    static let bottomForThirdPhoto: CGFloat = -12
    
    //MARK: - for fourthPhoto
    static let trailingMarginForFourthPhoto: CGFloat = -12
    static let bottomForFourthPhoto: CGFloat = -12
    
    //MARK: - for Checker
    static let login = "Джейк Салли".hash
    static let password = "StrongPassword".hash
    static let titleAlert = "Ошибка ввода"
    static let message = "Введены не корректные данные"

    //MARK: - Constant string
    static let fullName = "Джейк Салли"
    static let avatar = "avatar"
    static let status = "Waiting for something..."
    static let showStatus = "Show status"
    static let logIn = "Log In"
    static let firstButton = "First button"
    static let secondButton = "Second button"
    static let alert = "Alert"
    static let checkWord = "Проверить слово"
    static let wordTextField = "Введите слово для проверки"
}
