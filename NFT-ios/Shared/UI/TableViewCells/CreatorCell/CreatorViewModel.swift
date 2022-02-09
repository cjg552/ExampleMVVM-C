//
//  TeacherViewModel.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 22/1/22.
//

struct CreatorViewModel: DetailTableItemProtocol {
    var type: DetailTableItemType {
        .creator
    }
    
    var name: String!
    var location: String!
    var avatarUrl: String!
}
