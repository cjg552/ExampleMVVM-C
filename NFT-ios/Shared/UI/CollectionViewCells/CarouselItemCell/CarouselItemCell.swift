//
//  CarouselCardCell.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 19/1/22.
//

import UIKit

class CarouselItemCell: UICollectionViewCell {
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var bottomShadowImageView: UIImageView = {
       let imageView = UIImageView(image: UIImage(named: "shadow_bottom"))
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    var topLeftShadowImageView: UIImageView = {
       let imageView = UIImageView(image: UIImage(named: "shadow_top_left"))
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    var topRightShadowImageView: UIImageView = {
       let imageView = UIImageView(image: UIImage(named: "shadow_top_right"))
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        label.textAlignment = .center
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
        contentView.addSubview(imageView)
        contentView.addSubview(bottomShadowImageView)
        contentView.addSubview(topLeftShadowImageView)
        contentView.addSubview(topRightShadowImageView)
        contentView.addSubview(titleLabel)
    }
    
    private func setupLayout() {
        imageView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview().inset(0)
        }
        
        bottomShadowImageView.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview().inset(0)
            make.height.equalTo(200)
        }
        
        topLeftShadowImageView.snp.makeConstraints { make in
            make.top.left.equalToSuperview().inset(0)
            make.width.equalTo(163)
            make.height.equalTo(163)
        }
        
        topRightShadowImageView.snp.makeConstraints { make in
            make.top.right.equalToSuperview().inset(0)
            make.width.equalTo(163)
            make.height.equalTo(163)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(200)
            make.width.equalTo(300)
            make.bottom.equalTo(self.contentView).offset(-50)
            make.centerX.equalTo(self.contentView)
        }
    }
    
    func update(viewModel: CarouselItemViewModel) {
        titleLabel.text = viewModel.title
        guard let url = URL(string: viewModel.imageUrl ?? "") else { return }
        imageView.sd_setImage(with: url, completed: nil)
    }
    
}
