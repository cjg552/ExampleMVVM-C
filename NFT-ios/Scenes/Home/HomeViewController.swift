//
//  HomeViewController.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 17/1/22.
//

import UIKit

class HomeViewController: UIViewController {
    var collectionView: UICollectionView!
    var viewModel: HomeViewModelProtocol!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    convenience init(viewModel: HomeViewModelProtocol!) {
        self.init()
        self.viewModel = viewModel
        self.viewModel.viewDelegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        viewModel.eventViewDidLoad()
        title = "Best NFT"
    }
   
    private func setupCollectionView() {
        let layouts = UICollectionViewCompositionalLayout {[weak self] (section: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let type = self?.viewModel.typeOfSection(section)
            switch type {
            case .carousel:
                return CollectionLayoutBuilder.carruselSectionLayout(size: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.50)))
            case .popular:
                return CollectionLayoutBuilder.horizontalCardsSectionLayout(size: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalHeight(0.39)))
            case .none:
                return nil
            }
        }
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layouts)
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        
        for cellType in HomeItemType.allCases {
            collectionView.register(cellType.cellClass, forCellWithReuseIdentifier: cellType.idCell)
        }
        view.addSubview(collectionView)
        collectionView.register(TitleCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "PopularHeader")
        
        collectionView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview().inset(0)
        }
    }
    
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection(section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewModel = viewModel.viewModelFoIndexPath(indexPath)
        let cell = viewModel.type.cellType.cellForCollectionView(collectionView, cellForRowAt: indexPath, idCell: viewModel.type.idCell)
        viewModel.type.cellType.drawCell(cell: cell, withViewModel: viewModel)
        
        if let carouselCell = cell as? CarouselCell {
            carouselCell.delegate = self
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let titleHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "PopularHeader", for: indexPath) as! TitleCollectionReusableView
        titleHeader.titleLabel.text = NSLocalizedString("popular:section_title", comment: "")
        return titleHeader
    }
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.eventDidSelectItemAtIndexPath(indexPath)
    }
}

// MARK: - HomeViewProtocol
extension HomeViewController: HomeViewProtocol {
    func updateAll() {
        collectionView.reloadData()
    }
}

// MARK: - CarouselCellDelegate
extension HomeViewController: CarouselCellDelegate {
    func carouselCell(_ cell: CarouselCell, didSelectRow row: Int) {
        viewModel.eventDidSelectCarouselAtRow(row)
    }
    
    func carouselCell(_ cell: CarouselCell, didPressWatchInRow row: Int) {
        viewModel.eventDidSelectCarouselAtRow(row)
    }
}
