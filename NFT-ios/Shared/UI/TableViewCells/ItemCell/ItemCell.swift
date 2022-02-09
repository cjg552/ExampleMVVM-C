//
//  ItemCell.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 21/1/22.
//

import UIKit

class ItemCell: UITableViewCell, TableViewCellDrawer {
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()
    
    var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.sizeToFit()
        return imageView
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.customColor(type: .titleCard)
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.lineBreakMode = .byClipping
        label.sizeToFit()
        return label
    }()
    
    var annotationView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(type: .annotation)
        view.sizeToFit()
        return view
    }()
    
    var annotationTextLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.sizeToFit()
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubviews()
        setupLayout()
        annotationView.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addSubviews() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(annotationView)
        annotationView.addSubview(annotationTextLabel)
    }
    
    private func setupLayout() {
        stackView.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview().inset(20)
        }
    
        annotationTextLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(5)
            make.trailing.leading.equalToSuperview().inset(8)
        }
        
    }
    
    func drawCell(cell: UITableViewCell, withViewModel viewModel: DetailTableItemProtocol) {
        if let cell = cell as? ItemCell, let item = viewModel as? ItemViewModel {
            cell.iconImageView.image = UIImage(systemName: item.icon)
            cell.titleLabel.text = item.title
            cell.annotationView.isHidden = (item.annotation == nil)
            cell.annotationTextLabel.text = item.annotation
        }
    }
    

}
