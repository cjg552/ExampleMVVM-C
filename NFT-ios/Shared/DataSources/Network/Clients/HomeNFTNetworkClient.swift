//
//  HomeNetworkClient.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 18/1/22.
//

import UIKit

class HomeNFTNetworkClient: NetworkClient {
    
    init() {
        super.init(urlService: URL(string: EndPoints.homeNFTs)!, requestData: nil, httpMethod: .get)
    }
    
    override func processError(_ error: Error) {
        
    }
    
    override func processResponseData(_ data: Data?) {
        if let dataJson = data {
            let decoder = JSONDecoder()
            do {
                let nfts = try decoder.decode([NFTAPI].self, from: dataJson)
                blockCallBack(nfts, nil)
            }
            catch let error {
                print("Decoding Error: \(error.localizedDescription)")
                blockCallBack([], nil)
            }
        }
    }

}
