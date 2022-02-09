//
//  DetailViewModelTests.swift
//  NFT-iosTests
//
//  Created by Carlos Jimenez on 23/1/22.
//

import XCTest
@testable import NFT_ios

class DetailViewModelTests: XCTestCase {
    
    
    func testInit() {
        let mockRepository = MockNFTRepository()
        let nftMocked = mockRepository.getNFT()
        let viewModel = DetailViewModel(nft: nftMocked)
        XCTAssertNotNil(viewModel.nft)
    }
    
    func testTeacherViewModel() {
        let mockRepository = MockNFTRepository()
        let nftMocked = mockRepository.getNFT()
        let viewModel = DetailViewModel(nft: nftMocked)
        let teacherViewModel = viewModel.creatorViewModel()
        XCTAssertEqual(teacherViewModel.name, nftMocked.creator.name)
        XCTAssertEqual(teacherViewModel.location, nftMocked.location)
        XCTAssertEqual(teacherViewModel.avatarUrl, nftMocked.creator.avatarUrl)
    }

    
    func testNumberOfItemsInSection() {
        let mockRepository = MockNFTRepository()
        let nftMocked = mockRepository.getNFT()
        let viewModel = DetailViewModel(nft: nftMocked)
        XCTAssertEqual(viewModel.numberOfItemsInSection(0), 2)
        XCTAssertEqual(viewModel.numberOfItemsInSection(1), 1)
        XCTAssertEqual(viewModel.numberOfItemsInSection(2), 6)
        XCTAssertEqual(viewModel.numberOfItemsInSection(3), 1)
    }
    
    func testTypeOfSection() {
        let mockRepository = MockNFTRepository()
        let nftMocked = mockRepository.getNFT()
        let viewModel = DetailViewModel(nft: nftMocked)
        XCTAssertEqual(viewModel.typeOfSection(0), .photo)
        XCTAssertEqual(viewModel.typeOfSection(1), .mainInfo)
        XCTAssertEqual(viewModel.typeOfSection(2), .otherInfo)
        XCTAssertEqual(viewModel.typeOfSection(3), .creator)
    }
    

    func testPercentOfValue() {
        let mockRepository = MockNFTRepository()
        let nftMocked = mockRepository.getNFT()
        let viewModel = DetailViewModel(nft: nftMocked)
        XCTAssertEqual(viewModel.percentOfValue(100, total: 100), 100)
        XCTAssertEqual(viewModel.percentOfValue(50, total: 100), 50)
        XCTAssertEqual(viewModel.percentOfValue(0, total: 100), 0)
        XCTAssertEqual(viewModel.percentOfValue(25, total: 100), 25)
    }
    
    func testSubtitlesFormatted() {
        let mockRepository = MockNFTRepository()
        let nftMocked = mockRepository.getNFT()
        let viewModel = DetailViewModel(nft: nftMocked)
        XCTAssertEqual(viewModel.subtitlesFormatted(subtitles: ["AAA", "BBB"]), "AAA / BBB /")
    }

}
