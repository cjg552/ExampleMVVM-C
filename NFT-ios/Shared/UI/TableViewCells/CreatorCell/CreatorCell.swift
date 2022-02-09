//
//  CreatorCell.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 21/1/22.
//

import UIKit

class CreatorCell: UITableViewCell, TableViewCellDrawer {
    
    var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = UIColor.lightGray
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = UIColor.customColor(type: .titleCard)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubviews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addSubviews() {
        contentView.addSubview(avatarImageView)
        contentView.addSubview(nameLabel)
    }
    
    private func setupLayout() {
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(25)
        }
        
        avatarImageView.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel).offset(30)
            make.bottom.lessThanOrEqualToSuperview().offset(-10)
        }
    }
    
    func drawCell(cell: UITableViewCell, withViewModel viewModel: DetailTableItemProtocol) {
        if let cell = cell as? CreatorCell, let item = viewModel as? CreatorViewModel {
            cell.nameLabel.text = item.name
            guard let urlAvatar = URL(string: item.avatarUrl) else { return }
            cell.avatarImageView.sd_setImage(with: urlAvatar, completed: nil)
        }
    }
}
