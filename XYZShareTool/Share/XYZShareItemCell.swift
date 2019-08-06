//
//  XYZShareItemCell.swift
//  XYZShareTool
//
//  Created by 张小杨 on 2019/8/6.
//  Copyright © 2019 张小杨. All rights reserved.
//

import UIKit

class XYZShareItemCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var itemImage: UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    func setupSubViews() {
        self.contentView.backgroundColor = UIColor.white
        self.contentView.addSubview(itemImage)
        self.contentView.addSubview(titleLabel)
        itemImage.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.width.equalTo(50)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(itemImage.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
        }
    }
    
}
