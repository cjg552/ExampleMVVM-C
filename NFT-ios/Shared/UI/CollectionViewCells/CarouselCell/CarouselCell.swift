//
//  CarouselCell.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 17/1/22.
//

import UIKit
import SDWebImage

protocol CarouselCellDelegate: AnyObject {
    func carouselCell(_ cell: CarouselCell, didSelectRow row: Int)
    func carouselCell(_ cell: CarouselCell, didPressWatchInRow row: Int)
}

class CarouselCell: UICollectionViewCell, CollectionViewCellDrawer {
    var viewModel: CarouselViewModel!
    weak var delegate: CarouselCellDelegate?
    var collectionView: UICollectionView!
    private var indexOfCellBeforeDragging = 0
    
    var actionButton: UIButton = {
        let button = UIButton.customButton(type: .carousel)
        button.setTitle("Watch", for: [])
        button.addTarget(self, action: #selector(watchButtonPressed), for: .touchUpInside)
        return button
    }()
    
    var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        return pageControl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
        addSubviews()
        setupLayout()
        pageControl.addTarget(self, action: #selector(pageControlChanged), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupCollectionView() {
        let layouts = UICollectionViewCompositionalLayout { (section: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            return CollectionLayoutBuilder.carruselCardLayout(size: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        }
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layouts)
        collectionView.backgroundColor = UIColor.white
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CarouselItemCell.self, forCellWithReuseIdentifier: "CarouselCardCell")
        collectionView.contentInsetAdjustmentBehavior = .never
    }
    
    private func addSubviews() {
        contentView.addSubview(collectionView)
        contentView.addSubview(actionButton)
        contentView.addSubview(pageControl)
    }
    
    private func setupLayout() {
        collectionView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview().inset(0)
        }
        
        actionButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(150)
            make.bottom.equalTo(contentView).offset(-50)
            make.centerX.equalTo(contentView)
        }
        
        pageControl.snp.makeConstraints { make in
            make.bottom.equalTo(contentView).offset(-10)
            make.height.equalTo(25)
            make.width.equalTo(200)
            make.centerX.equalTo(contentView)
        }
    }
    
    @objc private func pageControlChanged() {
        let index = pageControl.currentPage
        collectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .left, animated: true)
    }
    
    @objc private func watchButtonPressed() {
        guard let cell = collectionView.visibleCells.first else { return }
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        delegate?.carouselCell(self, didPressWatchInRow: indexPath.row)
    }
    
    private func updateCurrentPageControl() {
        guard let cell = collectionView.visibleCells.first else { return }
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        pageControl.currentPage = indexPath.row
    }
    
    func drawCell(cell: UICollectionViewCell, withViewModel viewModel: HomeItemProtocol) {
        if let cell = cell as? CarouselCell, let viewModel = viewModel as? CarouselViewModel {
            cell.viewModel = viewModel
            cell.actionButton.setTitle(viewModel.titleActionButton, for: [])
            cell.pageControl.currentPage = viewModel.indexSelected
            cell.pageControl.numberOfPages = viewModel.rows.count
            cell.collectionView.reloadData()
        }
    }
    
}

extension CarouselCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselCardCell", for: indexPath) as? CarouselItemCell)!
        let cellViewModel = viewModel.rows[indexPath.row]
        cell.update(viewModel: cellViewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        updateCurrentPageControl()
    }
    
}

extension CarouselCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.carouselCell(self, didSelectRow: indexPath.row)
    }
}

