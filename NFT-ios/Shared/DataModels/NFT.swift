//
//  NFT.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 18/1/22.
//

import Foundation

struct NFT {
    var id: String
    var thumbnailUrl: String
    var title: String
    var description: String
    var location: String
    var photosCount: Int
    var offers: Int
    var audio: String
    var chains: [String]
    var level: String
    var creator: Creator
    var reviews: Reviews

}
