//
//  DescriptionCell.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 21/1/22.
//

import UIKit

class DescriptionCell: UITableViewCell, TableViewCellDrawer {
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.customColor(type: .subtitleCard)
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.contentMode = .topLeft
        label.sizeToFit()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.addSubview(descriptionLabel)
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    
    func drawCell(cell: UITableViewCell, withViewModel viewModel: DetailTableItemProtocol) {
        if let cell = cell as? DescriptionCell, let item = viewModel as? DescriptionViewModel {
            cell.descriptionLabel.text = item.description
        }
    }

}
