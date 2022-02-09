//
//  CollectionViewCellDrawer.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 7/2/22.
//

import Foundation
import UIKit

protocol CollectionViewCellDrawer {
    func cellForCollectionView(_ collectionView: UICollectionView, cellForRowAt indexPath: IndexPath, idCell: String) -> UICollectionViewCell
    func drawCell(cell: UICollectionViewCell , withViewModel viewModel: HomeItemProtocol)
}

extension CollectionViewCellDrawer {
    func cellForCollectionView(_ collectionView: UICollectionView, cellForRowAt indexPath: IndexPath, idCell: String) -> UICollectionViewCell {
            return collectionView.dequeueReusableCell(withReuseIdentifier: idCell, for: indexPath)
    }
}
