//
//  CollectionLayoutBuilder.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 17/1/22.
//

import UIKit

class CollectionLayoutBuilder {
    
    static func horizontalCardsSectionLayout(size: NSCollectionLayoutSize, itemInset: NSDirectionalEdgeInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 20.0, bottom: 0.0, trailing: 10.0), sectionInset: NSDirectionalEdgeInsets = NSDirectionalEdgeInsets(top: 16.0, leading: 0.0, bottom: 16.0, trailing: 0.0)) -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = itemInset
        let group = NSCollectionLayoutGroup.vertical(layoutSize: size, subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = sectionInset
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                heightDimension: .absolute(70.0))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                 elementKind: UICollectionView.elementKindSectionHeader,
                                                                         alignment: .top)
        section.boundarySupplementaryItems = [header]
        return section
    }
    
    static func carruselSectionLayout(size: NSCollectionLayoutSize, itemInset: NSDirectionalEdgeInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0), sectionInset: NSDirectionalEdgeInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)) -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = itemInset
        let group = NSCollectionLayoutGroup.vertical(layoutSize: size, subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = sectionInset
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        return section
    }
    
    static func carruselCardLayout(size: NSCollectionLayoutSize, itemInset: NSDirectionalEdgeInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0), sectionInset: NSDirectionalEdgeInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)) -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = itemInset
        let group = NSCollectionLayoutGroup.vertical(layoutSize: size, subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = sectionInset
        section.orthogonalScrollingBehavior = .groupPagingCentered
        return section
    }
    
}
