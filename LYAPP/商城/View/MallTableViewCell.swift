//
//  MallTableViewCell.swift
//  LYAPP
//
//  Created by 科技 on 2020/5/9.
//  Copyright © 2020 科技. All rights reserved.
//

import UIKit

class MallTableViewCell: UITableViewCell {

    @IBOutlet weak var imgV: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var oldPriceLabel: UILabel!
    
    @IBOutlet weak var salesLabel: UILabel!
    
    @IBOutlet weak var addCartBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setDataDic(dataDic:Dictionary<String, Any>){
        imgV.kf.setImage(with: URL.init(string: dataDic["goods_image"] as! String))
        titleLabel.text = dataDic["goods_name"] as? String
        descLabel.text = dataDic["selling_point"] as? String
        let goodsDic = dataDic["goods_sku"] as! Dictionary<String, Any>
        priceLabel.text = "￥\(goodsDic["goods_price"]as!String)"
        oldPriceLabel.text = "￥\(goodsDic["line_price"]as!String)"
        salesLabel.text = "共销售\(dataDic["goods_sales"] ?? "0")件"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
