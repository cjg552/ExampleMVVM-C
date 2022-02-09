//
//  CardViewModel.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 22/1/22.
//

struct CardViewModel: HomeItemProtocol {
    var type: HomeItemType {
        .popular
    }
    var title: String = ""
    var author: String = ""
    var actionButtonTitle = ""
    var imageUrl: String?
}
