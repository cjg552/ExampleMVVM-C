//
//  PhotoViewModel.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 8/2/22.
//

import Foundation

struct PhotoViewModel: DetailTableItemProtocol {
    var type: DetailTableItemType {
        .photo
    }
    
    var photoUrl: String
}
