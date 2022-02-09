//
//  NFTRepository.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 18/1/22.
//

import Foundation

protocol NFTRepository {
    func fetchNFTs(completion: @escaping ([NFT], Error?) -> Void)
}
