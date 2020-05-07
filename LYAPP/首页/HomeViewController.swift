//
//  HomeViewController.swift
//  LYAPP
//
//  Created by 科技 on 2020/5/7.
//  Copyright © 2020 科技. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    let HomeOneCellID = "HomeOneCell"
    let HomeTwoCellID = "HomeTwoCell"
    let HomeThreeCellID = "HomeThreeCell"
    let HomeFourCellID = "HomeFourCell"
    let HomeHederViewID = "CollectionHeaderView"
    let HomeFooterViewID = "CollectionFooterView"
    let HomeFiveCellID = "HomeFiveCell"
    var collectionView : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "隆源商城"
        initCollectionView()
        
        
    }
    
    func initCollectionView(){
        let flayout = UICollectionViewFlowLayout()
        self.collectionView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: flayout)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.backgroundColor = .white
        self.collectionView.register(HomeOneCell.self, forCellWithReuseIdentifier:HomeOneCellID)
        self.collectionView.register(UINib(nibName: HomeTwoCellID, bundle: nil), forCellWithReuseIdentifier: HomeTwoCellID)
        self.collectionView.register(UINib(nibName: HomeThreeCellID, bundle: nil), forCellWithReuseIdentifier: HomeThreeCellID)
        self.collectionView.register(UINib(nibName: HomeFourCellID, bundle: nil), forCellWithReuseIdentifier: HomeFourCellID)
        self.collectionView.register(CollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeHederViewID)
        self.collectionView.register(CollectionFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: HomeFooterViewID)
        self.collectionView.register(HomeFiveCell.self, forCellWithReuseIdentifier: HomeFiveCellID)
        self.view.addSubview(self.collectionView!)
        
    }
    
  
    
 

}
extension HomeViewController :UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            return 8
        }
        if section == 3{
            return 8
        }
 
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell : HomeOneCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeOneCellID, for: indexPath) as! HomeOneCell 
            
            return cell
        }else if indexPath.section == 1{
            let cell : HomeThreeCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeThreeCellID, for: indexPath) as! HomeThreeCell
            return cell;
        } else if indexPath.section == 2{
            let cell : HomeTwoCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeTwoCellID, for: indexPath) as! HomeTwoCell
            return cell
        }else if indexPath.section == 3{
            let cell : HomeFourCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeFourCellID, for: indexPath) as! HomeFourCell
            return cell
        }else{
            let cell : HomeFiveCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeFiveCellID, for: indexPath) as! HomeFiveCell
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0{
            return CGSize(width: kScreenW, height: 200)
        }
        if indexPath.section == 1 {
            return CGSize(width: (kScreenW - 50) / 4, height: 100)
        }else if indexPath.section == 2{
            return CGSize(width: kScreenW, height: 280)
        }else if indexPath.section == 3{
            return CGSize(width: (kScreenW - 30)/2, height: 260)
        }else{
            return CGSize(width: kScreenW, height: 180)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10);
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 3{
            return CGSize.init(width: kScreenW, height: 40)
        }
        return CGSize.init(width: kScreenW, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 0{
            return CGSize.init(width: kScreenW, height: 0)
        }
        return CGSize.init(width: kScreenW, height: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView : CollectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeHederViewID, for: indexPath) as! CollectionHeaderView
            return headerView
        }else{
            let footView : CollectionFooterView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: HomeFooterViewID, for: indexPath) as! CollectionFooterView
            return footView
        }
        
    }
    
}

