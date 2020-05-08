//
//  HomeFourCell.swift
//  LYAPP
//
//  Created by 科技 on 2020/5/7.
//  Copyright © 2020 科技. All rights reserved.
//

import UIKit

class HomeFourCell: UICollectionViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var goodsImage: UIImageView!
    @IBOutlet weak var goodName: UILabel!
    @IBOutlet weak var goodDesc: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var addCartBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        layerShardow(view: bgView)
    }
    func layerShardow(view:UIView){
           view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.07).cgColor
           view.layer.shadowOffset = CGSize(width: 0, height: 0)
           view.layer.shadowOpacity = 1
           view.layer.shadowRadius = 4.5
           view.layer.cornerRadius = 3;
       }
    
    
    func setDataDic(dataDic:NSDictionary){
        self.goodsImage.kf.setImage(with: URL.init(string: dataDic["goods_image"] as! String))
        self.goodName.text = (dataDic["goods_name"] as! String)
        self.goodDesc.text = (dataDic["selling_point"] as! String);
        let goodsku = dataDic["goods_sku"] as! NSDictionary
        self.priceLabel.text = "￥\(goodsku["goods_price"] as! String)"
        self.sumLabel.text = "月销\(dataDic["goods_sales"] ?? "0")件"
    }
        
}
