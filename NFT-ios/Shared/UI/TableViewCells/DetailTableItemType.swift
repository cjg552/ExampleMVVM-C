//
//  DetailTableItemType.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 7/2/22.
//

import Foundation


protocol DetailTableItemProtocol{
    var type: DetailTableItemType { get }
}

enum DetailTableItemType: CaseIterable {
    case photo
    case title
    case description
    case creator
    case itemList
  
  var idCell: String {
      switch self {
      case.photo:
          return "PhotoTableViewCellIdentifier"
      case.title:
          return "TitleTableViewCellIdentifier"
      case.description:
          return "DescriptionTableViewCellIdentifier"
      case.creator:
          return "TeacherTableViewCellIdentifier"
      case.itemList:
          return "ItemListTableViewCellIdentifier"
      }
  }
  
  var cellType: TableViewCellDrawer {
      switch self {
      case.photo:
          return PhotoCell()
      case.title:
          return TitleCell()
      case.description:
          return DescriptionCell()
      case.creator:
          return CreatorCell()
      case.itemList:
          return ItemCell()
      }
  }
    
    var cellClass: AnyClass {
        switch self {
        case.photo:
            return PhotoCell.self
        case.title:
            return TitleCell.self
        case.description:
            return DescriptionCell.self
        case.creator:
            return CreatorCell.self
        case.itemList:
            return ItemCell.self
        }
    }
}
