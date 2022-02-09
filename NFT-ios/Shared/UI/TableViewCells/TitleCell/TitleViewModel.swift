//
//  TitleViewModel.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 4/2/22.
//

import Foundation

struct TitleViewModel: DetailTableItemProtocol {
    var type: DetailTableItemType {
        .title
    }
    var title: String!
}
