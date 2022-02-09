//
//  HeaderReusableView.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 17/1/22.
//

import UIKit
import SnapKit

class TitleCollectionReusableView: UICollectionReusableView {
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor  = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .left
        label.sizeToFit()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.bottom.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(-20)
            make.left.equalToSuperview().offset(20)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
        
}
