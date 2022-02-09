//
//  DetailViewControllerTests.swift
//  NFT-iosTests
//
//  Created by Carlos Jimenez on 23/1/22.
//

import XCTest
@testable import NFT_ios

class DetailViewControllerTests: XCTestCase {
    var viewController: DetailViewController!

    override func setUp() {
        let mockRepository = MockNFTRepository()
        let viewModel = DetailViewModel(nft: mockRepository.getNFT())
        viewController = DetailViewController(viewModel: viewModel)
        viewController.viewDidLoad()
        viewController.viewDidAppear(false)
    }

    override func tearDown() {
        viewController = nil
    }
    
    func testSetupTableView() {
        XCTAssertNotNil(viewController.tableView.superview)
        XCTAssertNotNil(viewController.tableView.delegate)
        XCTAssertNotNil(viewController.tableView.dataSource)
        XCTAssertNotNil(viewController.tableView.superview)
        XCTAssertEqual(viewController.tableView.style, UITableView.Style.plain)
        XCTAssertEqual(viewController.tableView.estimatedRowHeight, 44.0)
        XCTAssertEqual(viewController.tableView.separatorStyle, .singleLine)
        XCTAssertEqual(viewController.tableView.sectionHeaderTopPadding, 0.0)
    }
    
    func testNumberOfSections() {
        XCTAssertEqual(viewController.tableView.numberOfSections, viewController.viewModel.numberOfSections)
    }
    
    func testNumberOfRowsInSection() {
        for index in 0..<viewController.tableView.numberOfSections {
            XCTAssertEqual(viewController.tableView.numberOfRows(inSection: index),
                           viewController.viewModel.numberOfItemsInSection(index))
        }
    }

}
