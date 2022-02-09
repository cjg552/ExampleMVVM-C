//
//  HomeViewModel.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 17/1/22.
//

import Foundation


class HomeViewModel: HomeViewModelProtocol {
    weak var viewDelegate: HomeViewProtocol?
    var coordinator: HomeCoordinator?
    var repository: NFTRepository?
    
    let maxNFTInCarousel = 4
    var carousel: [NFT] = []
    var popular: [NFT] = []
    let sections: [SectionHome] = [.carousel, .popular]

    var numberOfSections: Int {
        return self.sections.count
    }
    
    init(repository: NFTRepository? = NFTNetWorkRepository())  {
        self.repository = repository
    }
    
    func numberOfItemsInSection(_ section: Int) -> Int {
        let sectionType = sections[section]
        switch sectionType {
        case .carousel:
            return 1
        case .popular:
            return popular.count
        }
    }
    
    func typeOfSection(_ section: Int) -> SectionHome {
        let sectionType = sections[section]
        return sectionType
    }
    
    func viewModelFoIndexPath(_ indexPath: IndexPath) -> HomeItemProtocol {
        let sectionType = sections[indexPath.section]
        switch sectionType {
        case .carousel:
            return carouselViewModel()
        case .popular:
            return popularViewModelForRow(indexPath.row)
        }
    }
    
    func popularViewModelForRow(_ row: Int) -> CardViewModel {
        let nft = popular[row]
        let viewModel = CardViewModel(title: nft.title,
                                            author: "\(NSLocalizedString("popular:of", comment: "")) \(nft.creator.name)",
                                            actionButtonTitle: "",
                                            imageUrl: nft.thumbnailUrl)
        return viewModel
    }
    
    func carouselViewModel() -> CarouselViewModel {
        var cardViewModels: [CarouselItemViewModel] = []
        for nft in carousel {
            let cardViewModel = CarouselItemViewModel(imageUrl: nft.thumbnailUrl, title: nft.title)
            cardViewModels.append(cardViewModel)
        }
        let viewModel = CarouselViewModel(rows: cardViewModels, indexSelected: 0, titleActionButton: NSLocalizedString("carousel:watch_button", comment: ""))
        return viewModel
    }
    
}
// MARK: - UI Events
extension HomeViewModel {
    func eventViewDidLoad() {
        repository?.fetchNFTs(completion: {[weak self] nfts, error in
            for nft in nfts {
                if self?.carousel.count == self?.maxNFTInCarousel {
                    self?.popular.append(nft)
                }
                else {
                    self?.carousel.append(nft)
                }
            }
            self?.viewDelegate?.updateAll()
        })
    }
    
    func eventDidPressSearch() {
        print("search button pressed")
    }
    
    func eventDidSelectWatchAtRow(_ row: Int) {
        let nftToShow = carousel[row]
        coordinator?.goToDetail(nft: nftToShow)
    }
    
    func eventDidSelectPopulatAtRow(_ row: Int) {
        let nftToShow = popular[row]
        coordinator?.goToDetail(nft: nftToShow)
    }
    
    func eventDidSelectCarouselAtRow(_ row: Int) {
        let nftToShow = carousel[row]
        coordinator?.goToDetail(nft: nftToShow)
    }
    
    func eventDidSelectItemAtIndexPath(_ indexPath: IndexPath) {
        let type = typeOfSection(indexPath.section)
        switch type {
        case .carousel:
            eventDidSelectCarouselAtRow(indexPath.row)
        case .popular:
            eventDidSelectPopulatAtRow(indexPath.row)
        }
    }
}
