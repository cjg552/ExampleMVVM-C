//
//  HomeViewModelProtocol.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 20/1/22.
//

import Foundation

enum SectionDetail {
    case photo
    case mainInfo
    case creator
    case otherInfo
}

protocol DetailViewModelProtocol : AnyObject {
    var viewDelegate: DetailViewProtocol? { get set }
    var numberOfSections: Int { get }
    func numberOfItemsInSection(_ section: Int) -> Int
    func viewModelForIndexPath(_ indexPath: IndexPath) -> DetailTableItemProtocol
    func typeOfSection(_ section: Int) -> SectionDetail
    func typeOfCellForIndexPath(_ indexPath: IndexPath) -> DetailTableItemType
    func eventDidPressBack()
}
