//
//  DetailViewModel.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 20/1/22.
//

import Foundation


class DetailViewModel: DetailViewModelProtocol {
    var viewDelegate: DetailViewProtocol?
    var coordinator: DetailCoordinator?
    var sections: [(section: SectionDetail, rows: [DetailTableItemProtocol])] = []
    var nft: NFT!
    
    var numberOfSections: Int {
        return sections.count
    }
    
    init(nft: NFT!)  {
        self.nft = nft
        self.loadSections()
    }
    
    private func loadSections() {
        sections = [(.photo , [TitleViewModel(title: nft.title), PhotoViewModel(photoUrl: nft.thumbnailUrl)]),
                    (.mainInfo, [DescriptionViewModel(description: nft.description)]),
                    (.otherInfo, [reviewsViewModel(), allPhotosViewModel(), offersViewModel(), audioViewModel(), chainsViewModel(), levelViewModel()]),
                    (.creator, [creatorViewModel()])]
    }
    
    func viewModelForIndexPath(_ indexPath: IndexPath) -> DetailTableItemProtocol {
        return sections[indexPath.section].rows[indexPath.row]
    }
    
    func creatorViewModel() -> CreatorViewModel {
        return CreatorViewModel(name: nft.creator.name, location: nft.location, avatarUrl: nft.creator.avatarUrl)
    }
    
    func reviewsViewModel() -> ItemViewModel {
        let percent = percentOfValue(Float(nft.reviews.positive), total: Float(nft.reviews.total))
        return ItemViewModel(icon: "hand.thumbsup.fill", title: "\(percent)% \(NSLocalizedString("detail:positive_reviews", comment: ""))")
    }
    
    func allPhotosViewModel() -> ItemViewModel {
        return ItemViewModel(icon: "photo.fill.on.rectangle.fill", title: "\(nft.photosCount) \(NSLocalizedString("detail:photos", comment: ""))")
    }
    
    func offersViewModel() -> ItemViewModel {
        return ItemViewModel(icon: "person.2.fill", title: "\(nft.offers) \(NSLocalizedString("detail:offers", comment: ""))")
    }
    
    func audioViewModel() -> ItemViewModel {
        return ItemViewModel(icon: "airpods", title: nft.audio)
    }
    
    func chainsViewModel() -> ItemViewModel {
        return ItemViewModel(icon: "bitcoinsign.circle.fill", title: subtitlesFormatted(subtitles: nft.chains))
    }
    
    func levelViewModel() -> ItemViewModel {
        return ItemViewModel(icon: "chart.bar.fill", title: "\(NSLocalizedString("detail:level", comment: ""))", annotation: "\(nft.level.uppercased())")
    }
    
    func numberOfItemsInSection(_ section: Int) -> Int {
        return sections[section].rows.count
    }
    
    func typeOfSection(_ section: Int) -> SectionDetail {
        return sections[section].section
    }
    
    func typeOfCellForIndexPath(_ indexPath: IndexPath) -> DetailTableItemType {
        return sections[indexPath.section].rows[indexPath.row].type
    }
    
    
    func percentOfValue(_ value: Float, total: Float) -> Int {
        return Int((value / total) * 100)
    }
    
    func subtitlesFormatted(subtitles: [String]) -> String {
        if subtitles.count == 0 {
            return NSLocalizedString("detail:none", comment: "")
        }
        return "\(subtitles.joined(separator: " / ")) /"
    }
    
}

extension DetailViewModel {
    func eventDidPressBack() {
        coordinator?.finish()
    }
}

