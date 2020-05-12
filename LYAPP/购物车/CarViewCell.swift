//
//  CarViewCell.swift
//  LYAPP
//
//  Created by 科技 on 2020/5/12.
//  Copyright © 2020 科技. All rights reserved.
//

import UIKit

class CarViewCell: UICollectionViewCell {
    
    @IBOutlet weak var selectBtn: UIButton!
    
    @IBOutlet weak var goodsImage: UIImageView!
    
    @IBOutlet weak var goodsName: UILabel!
    
    @IBOutlet weak var guige: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var numLabel: UILabel!
    
    @IBOutlet weak var minusBtn: UIButton!
    
    @IBOutlet weak var addBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.minusBtn.addTarget(self, action: #selector(leftBtnClick), for: .touchUpInside)
        self.addBtn.addTarget(self, action: #selector(rightBtnClick), for: .touchUpInside)
    }
    
    @objc func leftBtnClick(){
        var count = Int(self.numLabel.text ?? "0")!
        count = count - 1
        
        if count <= 0 {
            return
        }
        self.numLabel.text = "\(count)"
        
    }
    
    @objc func rightBtnClick(){
        var count = Int(self.numLabel.text ?? "0")!
        count = count + 1
        self.numLabel.text = "\(count)"
    }
    
}
