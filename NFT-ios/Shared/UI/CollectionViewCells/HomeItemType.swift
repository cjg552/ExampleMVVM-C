//
//  HomeItemType.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 7/2/22.
//

import Foundation

protocol HomeItemProtocol{
  var type: HomeItemType { get }
}

enum HomeItemType: CaseIterable {
    case carousel
    case popular
  
  var idCell: String {
    switch self {
    case.carousel:
        return "CarouselViewCellIdentifier"
    case.popular:
        return "PopularViewCellIdentifier"
    }
  }
  
  var cellType: CollectionViewCellDrawer {
      switch self {
    case.carousel:
        return CarouselCell()
    case.popular:
        return NFTCell()
    }
  }
    
    var cellClass: AnyClass {
        switch self {
        case.carousel:
            return CarouselCell.self
        case.popular:
            return NFTCell.self
        }
    }
}

