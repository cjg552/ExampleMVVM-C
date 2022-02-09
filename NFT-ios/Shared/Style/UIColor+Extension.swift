//
//  UIColor+Extension.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 18/1/22.
//

import Foundation
import UIKit

enum CustomColor {
    case tintWindow
    case actionButtonCarousel
    case titleButtonCarousel
    case titleCarousel
    case titleSection
    case titleCard
    case subtitleCard
    case backgroundScreen
    case navigationBar
    case annotation
    case lineSeparator
    
}

extension UIColor {
    static func customColor(type: CustomColor) -> UIColor {
        switch type {
        case .tintWindow:
            return UIColor.black
        case .actionButtonCarousel:
            return UIColor.black
        case .titleButtonCarousel:
            return UIColor.white
        case .titleCarousel:
            return UIColor.white
        case .titleSection:
            return UIColor(red: 57/255, green: 57/255, blue: 57/255, alpha: 1.0)
        case .titleCard:
            return UIColor(red: 57/255, green: 57/255, blue: 57/255, alpha: 1.0)
        case .subtitleCard:
            return UIColor(red: 174/255, green: 174/255, blue: 174/255, alpha: 1.0)
        case .backgroundScreen:
            return UIColor.white
        case .navigationBar:
            return UIColor.white
        case .annotation:
            return UIColor.black
        case .lineSeparator:
            return UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
        
        }
    }
}
