//
//  CarouselViewModel.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 22/1/22.
//

struct CarouselViewModel: HomeItemProtocol {
    var type: HomeItemType {
        .carousel
    }
    var rows: [CarouselItemViewModel] = []
    var indexSelected: Int = 0
    var titleActionButton: String = ""
    var numberOfSections: Int = 1
    var numberOfRows: Int {
        rows.count
    }
}
