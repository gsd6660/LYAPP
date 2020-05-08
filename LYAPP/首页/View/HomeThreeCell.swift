//
//  HomeThreeCell.swift
//  LYAPP
//
//  Created by 科技 on 2020/5/7.
//  Copyright © 2020 科技. All rights reserved.
//

import UIKit

class HomeThreeCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconImv: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func setData(dataDic:NSDictionary){
        self.nameLabel.text = (dataDic["name"] as! String)
        let imageDic = dataDic["image"] as! NSDictionary
        self.iconImv.kf.setImage(with: URL.init(string: imageDic["file_path"] as! String))
    }
    
}
