//
//  ItemViewModel.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 22/1/22.
//

struct ItemViewModel: DetailTableItemProtocol {
    var type: DetailTableItemType {
        .itemList
    }
    var icon: String!
    var title: String!
    var annotation: String?
}
