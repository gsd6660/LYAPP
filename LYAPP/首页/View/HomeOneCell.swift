//
//  HomeOneCell.swift
//  LYAPP
//
//  Created by 科技 on 2020/5/7.
//  Copyright © 2020 科技. All rights reserved.
//

import UIKit
import FSPagerView
import Kingfisher
class HomeOneCell: UICollectionViewCell {
    var pagerView : FSPagerView!
    var pagerControl : FSPageControl!
    var imageNames = NSMutableArray()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initPagerView()
    }
    
    func initPagerView() {
        self.pagerView = FSPagerView.init(frame: frame)
        self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        self.pagerView.itemSize = FSPagerView.automaticSize
        self.pagerView.delegate = self
        self.pagerView.dataSource = self
        self.pagerView.isInfinite = true
        self.pagerView.decelerationDistance = 0
        self.pagerControl = FSPageControl.init(frame: CGRect(x: 0, y: frame.height-20, width: frame.width, height: 20))
        self.pagerControl.contentHorizontalAlignment = .center
        self.pagerControl.contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0 )
        
        self.addSubview(self.pagerView)
        self.addSubview(self.pagerControl)
    }
    
    public func setDic(dataArray:NSArray){
        if self.imageNames.count>0 {
            self.imageNames.removeAllObjects()
        }
        for index in 0..<dataArray.count{
            var dic = NSDictionary()
            dic = dataArray[index] as! NSDictionary
            let imageDic = dic["image"] as! NSDictionary
            self.imageNames.addObjects(from: [imageDic["file_path"]!])
            
        }
        self.pagerControl.numberOfPages = imageNames.count
        pagerView.reloadData()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeOneCell : FSPagerViewDelegate,FSPagerViewDataSource{
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        
        return self.imageNames.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.kf.setImage(with: URL(string: self.imageNames[index] as! String))
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.clipsToBounds = true

        return cell
    }

    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.pagerControl.currentPage = targetIndex
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        self.pagerControl.currentPage = pagerView.currentIndex
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        print("选中第\(index)个")
    }
    
}

