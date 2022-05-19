//
//  CustomButton.swift
//  Navigation
//
//  Created by Александр Востриков on 18.05.2022.
//

import UIKit

class CustomButton: UIButton {
    
    let title: String
    let titleColor: UIColor

    init(title: String, titleColor: UIColor) {
        self.title = title
        self.titleColor = titleColor
        super.init(frame: .zero)
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonTapped(){
        
    }
}
