//
//  MockNFTRepository.swift
//  NFT-iosTests
//
//  Created by Carlos Jimenez on 22/1/22.
//
import Foundation
@testable import NFT_ios

class MockNFTRepository: NFTRepository {
    func fetchNFTs(completion: @escaping ([NFT], Error?) -> Void) {
        do {
            if let bundlePath = Bundle(for: type(of: self)).path(forResource: "NFTs", ofType: "json") {
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8)
                let nftsAPI = try JSONDecoder().decode([NFTAPI].self, from: jsonData!)
                var nfts: [NFT] = []
                nftsAPI.forEach { nftAPI in
                    let nft = nftAPI.nftModel()
                    nfts.append(nft)
                }
                completion(nfts, nil)
            }
            else {
                completion([], nil)
            }
        }
        catch {
            completion([], nil)
        }
    }
    
    func getNFT() -> NFT {
        return NFT(id: "387",
                      thumbnailUrl: "https://i.picsum.photos/id/40/500/500.jpg?hmac=4L40XQ64A-bQmM5jC9JfDiwj5J9_M14Mj9Kxz836pXE",
                      title: "¿Animales o amigos?",
                      description: "Colección NFT dedicada a nuestros amigos peludos que forman parte de nuestra familia. Los perros y los gatos",
                      location: "Barcelona, Spain",
                      photosCount: 50,
                      offers: 161905,
                      audio: "Spanish",
                      chains: ["BTC", "ETH", "ADA"],
                      level: "Beginner",
                      creator: Creator(name: "Carlos Jiménez", avatarUrl: "https://i.pravatar.cc/150?u=a042581f4e290267041"),
                      reviews: Reviews(positive: 4008, total: 4100))
    }
}
