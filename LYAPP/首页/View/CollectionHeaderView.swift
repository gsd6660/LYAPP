//
//  CollectionHeaderView.swift
//  LYAPP
//
//  Created by 科技 on 2020/5/7.
//  Copyright © 2020 科技. All rights reserved.
//

import UIKit
import SnapKit
class CollectionHeaderView: UICollectionReusableView {
        override init(frame: CGRect) {
           super.init(frame: frame)
            self.backgroundColor = .white
            
            let imageView = UIImageView()
            imageView.image = UIImage.init(named: "green-juxing")
            self.addSubview(imageView)
            imageView.snp_makeConstraints { (make) in
                make.left.equalTo(12.5)
                make.top.height.equalTo(16)
                make.size.equalTo(CGSize(width: 3, height: 17))
            }
            
            let titleLabel = UILabel()
            let string = NSMutableAttributedString.init(string: "新品上市", attributes: [NSMutableAttributedString.Key.foregroundColor:GreenColor,NSMutableAttributedString.Key.font:UIFont.init(name: "PingFang SC", size: 17)!])
            titleLabel.attributedText = string
            self.addSubview(titleLabel)
            titleLabel.snp_makeConstraints { (make) in
                make.left.equalTo(imageView.snp_right).offset(5)
                make.top.height.equalTo(16)
                make.width.equalTo(100)
            }
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
}
