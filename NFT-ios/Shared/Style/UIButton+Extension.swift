//
//  UIButton+Extension.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 18/1/22.
//

import Foundation
import UIKit

enum CustomButtonType {
    case carousel
}

extension UIButton {
    static func customButton(type: CustomButtonType) -> UIButton {
        switch type {
        case .carousel:
            let button = UIButton(type: .system)
            button.layer.cornerRadius = 8.0
            button.layer.borderColor = UIColor.white.cgColor
            button.layer.borderWidth = 1.0
            button.setTitleColor(UIColor.customColor(type: .titleButtonCarousel), for: [])
            button.titleLabel?.font = UIFont.systemFont(ofSize: 17.0, weight: .medium)
            button.titleLabel?.textAlignment = .center
            button.backgroundColor = UIColor.customColor(type: .actionButtonCarousel)
            return button
        }
    }
}
