//
//  TitleCell.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 21/1/22.
//

import UIKit

class TitleCell: UITableViewCell, TableViewCellDrawer {
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.customColor(type: .titleCard)
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.textAlignment = .center
        label.sizeToFit()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview().inset(20)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func drawCell(cell: UITableViewCell, withViewModel viewModel: DetailTableItemProtocol) {
        if let cell = cell as? TitleCell, let item = viewModel as? TitleViewModel {
            cell.titleLabel.text = item.title
        }
    }
}
