//
//  DescriptionViewModel.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 4/2/22.
//

import Foundation

struct DescriptionViewModel: DetailTableItemProtocol {
    var type: DetailTableItemType {
        .description
    }
    var description: String!
}
