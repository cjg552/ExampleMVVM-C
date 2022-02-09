//
//  TableViewCellsTests.swift
//  NFT-iosTests
//
//  Created by Carlos Jimenez on 23/1/22.
//

import XCTest
@testable import NFT_ios
import AVFoundation

class TableViewCellsTests: XCTestCase {


    func testTitleCellInit()  {
        let cell = TitleCell(style: .default, reuseIdentifier: "id")
        XCTAssertTrue(cell.selectionStyle == .none)
        XCTAssertNotNil(cell.titleLabel)
        XCTAssertNotNil(cell.titleLabel.superview)
    }
    
    
    func testDescriptionCellInit() {
        let cell = DescriptionCell(style: .default, reuseIdentifier: "id")
        XCTAssertTrue(cell.selectionStyle == .none)
        XCTAssertNotNil(cell.descriptionLabel.superview)
    }
    
    func testTeacherCellInit() {
        let cell = CreatorCell(style: .default, reuseIdentifier: "id")
        XCTAssertTrue(cell.selectionStyle == .none)
        XCTAssertNotNil(cell.nameLabel.superview)
        XCTAssertNotNil(cell.avatarImageView.superview)
    }
    
    func testTeacherCellUpdate() {
        let cell = CreatorCell(style: .default, reuseIdentifier: "id")
        cell.drawCell(cell: cell, withViewModel: CreatorViewModel(name: "Pepe", location: "Almería, España", avatarUrl: ""))
        XCTAssertEqual(cell.nameLabel.text, "Pepe")
        XCTAssertEqual(cell.avatarImageView.image, nil)
    }
    
    func testItemCellInit() {
        let cell = ItemCell(style: .default, reuseIdentifier: "id")
        XCTAssertTrue(cell.selectionStyle == .none)
        XCTAssertNotNil(cell.iconImageView.superview)
        XCTAssertNotNil(cell.titleLabel.superview)
        XCTAssertNotNil(cell.annotationView.superview)
    }
    
    func testItemCellUpdate() {
        let cell = ItemCell(style: .default, reuseIdentifier: "id")
        cell.drawCell(cell: cell, withViewModel: ItemViewModel(icon: "chart.bar.fill", title: "My title", annotation: "BEGINNER"))
        XCTAssertNotNil(cell.iconImageView.image)
        XCTAssertEqual(cell.titleLabel.text, "My title")
        XCTAssertFalse(cell.annotationView.isHidden)
        XCTAssertEqual(cell.annotationTextLabel.text, "BEGINNER")
    }

}
