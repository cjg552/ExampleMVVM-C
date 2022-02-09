//
//  NFTAPI.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 18/1/22.
//

import Foundation


struct NFTAPI: Codable {
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
    var creator: CreatorAPI
    var reviews: ReviewsAPI
    
    func nftModel() -> NFT {
        return NFT(id: id, thumbnailUrl: thumbnailUrl, title: title, description: description, location: location, photosCount: photosCount, offers: offers, audio: audio, chains: chains, level: level, creator: Creator(name: creator.name, avatarUrl: creator.avatarUrl), reviews: Reviews(positive: reviews.positive, total: reviews.total))
    }
}
