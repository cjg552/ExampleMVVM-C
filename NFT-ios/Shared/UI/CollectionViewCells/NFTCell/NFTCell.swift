//
//  NFTCell.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 17/1/22.
//

import UIKit
import SnapKit
import SDWebImage

class NFTCell: UICollectionViewCell, CollectionViewCellDrawer {
    var container: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowRadius = 4
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        return view
    }()
    
    var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
       }()
    
    var topImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.lightGray
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var mainTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.textAlignment = .left
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    var subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addSubviews() {
        contentView.addSubview(container)
        container.addSubview(cardView)
        cardView.addSubview(topImageView)
        cardView.addSubview(mainTitleLabel)
        cardView.addSubview(subtitleLabel)
    }
    
    private func setupLayout() {
        container.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview().inset(0)
        }
        
        cardView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview().inset(0)
        }
        
        topImageView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(self.cardView).inset(0)
        }
        
        
        subtitleLabel.snp.makeConstraints { make in
            make.left.equalTo(self.cardView).offset(10)
            make.right.equalTo(self.cardView).offset(-10)
            make.height.equalTo(25)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        mainTitleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self.subtitleLabel.snp.top).offset(-10)
            make.left.equalTo(self.cardView).offset(10)
            make.right.equalTo(self.cardView).offset(-10)
            make.height.equalTo(25)
        }
        
    }
    
    func drawCell(cell: UICollectionViewCell, withViewModel viewModel: HomeItemProtocol) {
        if let cell = cell as? NFTCell, let item = viewModel as? CardViewModel {
            cell.mainTitleLabel.text = item.title
            cell.subtitleLabel.text = item.author
            
            guard let urlImage = URL(string: item.imageUrl ?? "") else { return }
            cell.topImageView.sd_setImage(with: urlImage, completed: nil)
            cell.setNeedsUpdateConstraints()
        }
    }
    
}
