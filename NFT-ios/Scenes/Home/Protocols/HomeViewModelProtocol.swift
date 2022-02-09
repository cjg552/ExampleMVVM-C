//
//  HomeViewModelProtocol.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 17/1/22.
//

import Foundation

enum SectionHome {
    case carousel
    case popular
}

protocol HomeViewModelProtocol : AnyObject {
    var viewDelegate: HomeViewProtocol? {  get set }
    var coordinator: HomeCoordinator? { get set }
    var repository: NFTRepository? { get set }
    var numberOfSections: Int { get }
    func numberOfItemsInSection(_ section: Int) -> Int
    func typeOfSection(_ section: Int) -> SectionHome
    func viewModelFoIndexPath(_ indexPath: IndexPath) -> HomeItemProtocol
    
    func eventViewDidLoad()
    func eventDidSelectPopulatAtRow(_ row: Int)
    func eventDidSelectCarouselAtRow(_ row: Int)
    func eventDidSelectItemAtIndexPath(_ indexPath: IndexPath)
    func eventDidSelectWatchAtRow(_ row: Int)
    func eventDidPressSearch()
}
