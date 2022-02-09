//
//  NFT_iosTests.swift
//  NFT-iosTests
//
//  Created by Carlos Jimenez on 17/1/22.
//

import XCTest
@testable import NFT_ios

class HomeViewModelTests: XCTestCase {

    func testInit() {
        let mockRepository = MockNFTRepository()
        let viewModel = HomeViewModel(repository: mockRepository)
        XCTAssertNotNil(viewModel.repository)
        XCTAssertEqual(viewModel.maxNFTInCarousel, 4)
        XCTAssertEqual(viewModel.carousel.count, 0)
        XCTAssertEqual(viewModel.popular.count, 0)
        XCTAssertEqual(viewModel.sections, [.carousel, .popular])
    }
    
    func testNumberOfSections() {
        let viewModel = HomeViewModel()
        XCTAssertEqual(viewModel.numberOfSections, 2)
    }
    
    func testNumberOfItemsInSection() {
        let mockRepository = MockNFTRepository()
        let viewModel = HomeViewModel(repository: mockRepository)
        viewModel.eventViewDidLoad()
        XCTAssertEqual(viewModel.numberOfItemsInSection(0), 1)
        XCTAssertEqual(viewModel.numberOfItemsInSection(1), viewModel.popular.count)
    }
    
    func testTypeOfSection() {
        let mockRepository = MockNFTRepository()
        let viewModel = HomeViewModel(repository: mockRepository)
        viewModel.eventViewDidLoad()
        XCTAssertEqual(viewModel.typeOfSection(0), .carousel)
        XCTAssertEqual(viewModel.typeOfSection(1), .popular)
    }
    
    func testCarouselViewModel() {
        let mockRepository = MockNFTRepository()
        let viewModel = HomeViewModel(repository: mockRepository)
        viewModel.eventViewDidLoad()
        let carouselViewModel = viewModel.carouselViewModel()
        XCTAssertEqual(carouselViewModel.numberOfSections, 1)
        XCTAssertEqual(carouselViewModel.numberOfRows, 4)
        XCTAssertEqual(carouselViewModel.titleActionButton, NSLocalizedString("carousel:watch_button", comment: ""))
        XCTAssertEqual(carouselViewModel.indexSelected, 0)
        
        for index in 0..<carouselViewModel.rows.count {
            let nft = viewModel.carousel[index]
            let cardViewModel = carouselViewModel.rows[index]
            XCTAssertEqual(nft.title, cardViewModel.title)
            XCTAssertEqual(nft.thumbnailUrl, cardViewModel.imageUrl)
        }
    }
    
    func testPopularViewModels() {
        let mockRepository = MockNFTRepository()
        let viewModel = HomeViewModel(repository: mockRepository)
        viewModel.eventViewDidLoad()
        
        for index in 0..<viewModel.popular.count {
            let nft = viewModel.popular[index]
            let popularViewModel = viewModel.popularViewModelForRow(index)
            let expectedTitle = nft.title
            XCTAssertEqual(expectedTitle, popularViewModel.title)
            let expectedAuthor = "\(NSLocalizedString("popular:of", comment: "")) \(nft.creator.name)"
            XCTAssertEqual(expectedAuthor, popularViewModel.author)
            let expectedImageUrl = nft.thumbnailUrl
            XCTAssertEqual(expectedImageUrl, popularViewModel.imageUrl)
        }
    }
    
    
    func testViewDidLoad() {
        let mockRepository = MockNFTRepository()
        let viewModel = HomeViewModel(repository: mockRepository)
        viewModel.eventViewDidLoad()
        XCTAssertEqual(viewModel.carousel.count, 4)
        XCTAssertEqual(viewModel.popular.count, 7)
    }
    
    

}
