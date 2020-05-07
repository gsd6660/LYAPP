//
//  HomeTwoCell.swift
//  LYAPP
//
//  Created by 科技 on 2020/5/7.
//  Copyright © 2020 科技. All rights reserved.
//

import UIKit

class HomeTwoCell: UICollectionViewCell {
    
    @IBOutlet weak var leftImg: UIImageView!
    @IBOutlet weak var rightImg: UIImageView!
    
    @IBOutlet weak var v1: UIView!
    
    @IBOutlet weak var v2: UIView!
    
    @IBOutlet weak var v3: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layerShardow(view: v1)
        layerShardow(view: v2)
        layerShardow(view: v3)
                
    }
   
    func layerShardow(view:UIView){
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.07).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 4.5
        view.layer.cornerRadius = 3;
    }
    
}
