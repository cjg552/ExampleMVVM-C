//
//  CollectionViewCellsTests.swift
//  NFT-iosTests
//
//  Created by Carlos Jimenez on 23/1/22.
//

import XCTest
@testable import NFT_ios

class CollectionViewCellsTests: XCTestCase {

    func testNFTCellInit() {
        let cell = NFTCell(frame: .zero)
        XCTAssertNotNil(cell.container.superview)
        XCTAssertNotNil(cell.cardView.superview)
        XCTAssertNotNil(cell.topImageView.superview)
        XCTAssertNotNil(cell.mainTitleLabel.superview)
        XCTAssertNotNil(cell.subtitleLabel.superview)
    }
    
    func testNFTCellUpdate() {
        let cell = NFTCell(frame: .zero)
        cell.drawCell(cell: cell, withViewModel: CardViewModel(title: "A title", author: "Carlos", actionButtonTitle: "Watch", imageUrl: nil))
        XCTAssertEqual(cell.mainTitleLabel.text, "A title")
        XCTAssertEqual(cell.subtitleLabel.text, "Carlos")
        XCTAssertNil(cell.topImageView.image)
    }
    
    func testCarouselCellInit() {
        let cell = CarouselCell(frame: .zero)
        XCTAssertNotNil(cell.collectionView.superview)
        XCTAssertNotNil(cell.actionButton.superview)
        XCTAssertNotNil(cell.pageControl.superview)
        XCTAssertNotNil(cell.collectionView.delegate)
        XCTAssertNotNil(cell.collectionView.dataSource)
        XCTAssertTrue(cell.collectionView.contentInsetAdjustmentBehavior == .never)
        XCTAssertTrue(cell.collectionView.isPagingEnabled)
    }
    
    func testCarouselCellUpdate() {
        let cell = CarouselCell(frame: .zero)
        cell.drawCell(cell: cell, withViewModel: CarouselViewModel(rows: [CarouselItemViewModel(imageUrl: "myImage.jpg", title: "My title")], indexSelected: 0, titleActionButton: "Watch", numberOfSections: 1))
        XCTAssertEqual(cell.viewModel.numberOfRows, 1)
        XCTAssertEqual(cell.viewModel.numberOfSections, 1)
        XCTAssertEqual(cell.viewModel.titleActionButton, "Watch")
        XCTAssertEqual(cell.viewModel.rows.first!.imageUrl, "myImage.jpg")
        XCTAssertEqual(cell.viewModel.rows.first!.title, "My title")
    }
    
    func testCarouselCardCellInit() {
        let cell = CarouselItemCell(frame: .zero)
        XCTAssertNotNil(cell.imageView.superview)
        XCTAssertNotNil(cell.bottomShadowImageView.superview)
        XCTAssertNotNil(cell.topLeftShadowImageView.superview)
        XCTAssertNotNil(cell.topRightShadowImageView.superview)
        XCTAssertNotNil(cell.titleLabel.superview)
    }
    
    func testCarouselCardCellUpdate() {
        let cell = CarouselItemCell(frame: .zero)
        cell.update(viewModel: CarouselItemViewModel(imageUrl: nil, title: "A title"))
        XCTAssertNil(cell.imageView.image)
        XCTAssertEqual(cell.titleLabel.text, "A title")
    }

}
