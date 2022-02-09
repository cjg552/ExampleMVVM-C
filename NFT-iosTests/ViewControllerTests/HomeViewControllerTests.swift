//
//  HomeViewControllerTests.swift
//  NFT-iosTests
//
//  Created by Carlos Jimenez on 23/1/22.
//

import XCTest
@testable import NFT_ios

class HomeViewControllerTests: XCTestCase {
    var viewController: HomeViewController!

    override func setUp() {
        let mockRepository = MockNFTRepository()
        let viewModel = HomeViewModel(repository: mockRepository)
        viewController = HomeViewController(viewModel: viewModel)
        viewController.viewDidLoad()
    }

    override func tearDown() {
        viewController = nil
    }
    
    func testViewDidLoad() {
        XCTAssertNotNil(viewController.collectionView.superview)
        XCTAssertNotNil(viewController.collectionView.delegate)
        XCTAssertNotNil(viewController.collectionView.dataSource)
    }

    func testNumberOfSections() {
        XCTAssertEqual(viewController.collectionView.numberOfSections, viewController.viewModel.numberOfSections)
    }
    
    func testNumberOfItemsInSection() {
        for index in 0..<viewController.collectionView.numberOfSections {
            XCTAssertEqual(viewController.collectionView.numberOfItems(inSection: index),
                           viewController.viewModel.numberOfItemsInSection(index))
        }
    }
    

}
