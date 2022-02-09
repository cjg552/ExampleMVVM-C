//
//  NFTNetworkRepository.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 18/1/22.
//

import Foundation

class NFTNetWorkRepository: NFTRepository {
    func fetchNFTs(completion: @escaping ([NFT], Error?) -> Void) {
        let client = HomeNFTNetworkClient()
        client.sendRequest { (anObject, error) in
            if error == nil {
                let nftsAPI = anObject as! [NFTAPI]
                var nfts: [NFT] = []
                nftsAPI.forEach { nftAPI in
                    let nft = nftAPI.nftModel()
                    nfts.append(nft)
                }
                completion(nfts, nil)
            }
            else {
                completion([], error!)
            }
        }
    }
    
}
