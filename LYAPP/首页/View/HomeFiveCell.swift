//
//  HomeFiveCell.swift
//  LYAPP
//
//  Created by 科技 on 2020/5/7.
//  Copyright © 2020 科技. All rights reserved.
//

import UIKit

class HomeFiveCell: UICollectionViewCell {
    
    var articles = NSArray()
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.contentView.addSubview(tableView)
    }
    
    private lazy var tableView:UITableView={
        let tab = UITableView.init(frame: self.contentView.frame)
        tab.delegate = self
        tab.dataSource = self
        tab.separatorStyle = .none
        return tab
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setArray(articles:NSArray){
        self.articles = articles
        self.tableView.reloadData()
    }
    
}



extension HomeFiveCell : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cells")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cells")
            cell?.selectionStyle = .none
            cell?.textLabel?.font = customFont(font: 14)
            cell?.detailTextLabel?.font = customFont(font: 11)
        }
        if self.articles.count>0 {
            let dic = self.articles[indexPath.row] as! NSDictionary
            cell?.textLabel?.text = (dic["article_title"] as! String)
            cell?.detailTextLabel?.text = (dic["view_time"] as! String)
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
        
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenW, height: 50))
        let imageView = UIImageView(frame: CGRect(x: 12.5, y: 18, width: 3, height: 17))
        imageView.image = UIImage.init(named: "green-juxing")
        headerView.addSubview(imageView)
        
        let label = UILabel.init(frame: CGRect(x: 24, y: 18, width: 166, height: 17))
        label.numberOfLines = 0
        label.text = "隆源资讯 NEWS"
        headerView.addSubview(label)
        
        let rightBtn = UIButton.init(type: .custom)
        rightBtn.frame = CGRect(x: kScreenW - 53, y: 0, width: 60, height: 50)
        rightBtn.setTitle("更多", for: .normal)
        rightBtn.setTitleColor(GaryColor, for: .normal)
        rightBtn.setImage(UIImage.init(named: "jft_icon_rightarrow"), for: .normal)
        rightBtn.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 50)
        rightBtn.titleLabel?.font = customFont(font: 12)
        headerView.addSubview(rightBtn)
      
        return headerView
    }
    
    
}
