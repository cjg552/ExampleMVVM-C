//
//  VideoTrailerCell.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 21/1/22.
//

import UIKit



class PhotoCell: UITableViewCell, TableViewCellDrawer {
    var mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.white
        selectionStyle = .none
        addSubviews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addSubviews() {
        addSubview(mainImageView)
    }
    
    private func setupLayout() {
        mainImageView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview().inset(0)
        }
    }
    
    func drawCell(cell: UITableViewCell, withViewModel viewModel: DetailTableItemProtocol) {
        if let cell = cell as? PhotoCell, let viewModel = viewModel as? PhotoViewModel {
            guard let urlAvatar = URL(string: viewModel.photoUrl) else { return }
            cell.mainImageView.sd_setImage(with: urlAvatar, completed: nil)
        }
    }
    
}
