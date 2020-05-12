//
//  CartViewController.swift
//  LYAPP
//
//  Created by 科技 on 2020/5/7.
//  Copyright © 2020 科技. All rights reserved.
//

import UIKit

class CartViewController: BaseViewController {
    let oneCellID = "CarViewCell"
    let HomeFourCellID = "HomeFourCell"
    let HomeHederViewID = "CollectionHeaderView"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.collectionView)
    }
    
    
    
    private lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let col = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenW, height: kScreenH - kTabBarH - 40), collectionViewLayout: layout)
        col.backgroundColor = .clear
        col.delegate = self
        col.dataSource = self
        col.register(UINib.init(nibName: oneCellID, bundle: nil), forCellWithReuseIdentifier: oneCellID)
        col.register(CollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeHederViewID)
         col.register(UINib(nibName: HomeFourCellID, bundle: nil), forCellWithReuseIdentifier: HomeFourCellID)
        return col
    }()
    
 
}

extension  CartViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1{
           let cell : HomeFourCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeFourCellID, for: indexPath) as! HomeFourCell
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: oneCellID, for: indexPath) as! CarViewCell
            return cell
        }
     }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        if indexPath.section == 1 {
            return CGSize(width: (kScreenW - 30)/2, height: 260)
        }
        return CGSize.init(width: kScreenW, height: 110)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10);
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1{
            return CGSize.init(width: kScreenW, height: 40)
        }
        return CGSize.init(width: kScreenW, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView : CollectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeHederViewID, for: indexPath) as! CollectionHeaderView
        headerView.backgroundColor = .clear
        return headerView
         
        
    }
}


extension CartViewController{
    func initBottomView()  {
        let bottom = UIView()
        bottom.backgroundColor = .white
        self.view.addSubview(bottom)
        bottom.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(self.collectionView.snp_bottom).offset(0)
            make.height.equalTo(40)
        }
        
        let allBtn = UIButton.init(type: .custom)
        allBtn.setTitle("全选", for: .normal)
        allBtn.setImage(UIImage.init(named: "jft_but_Unselected"), for: .normal)
        allBtn.setImage(UIImage.init(named: "jft_but_selected"), for: .selected)
        allBtn.titleLabel?.font = customFont(font: 13)
        bottom.addSubview(allBtn)
        allBtn.snp.makeConstraints { (make) in
            make.right.equalTo(bottom.snp_left)
            make.centerY.equalTo(bottom.snp.centerY)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
        let rightBtn = UIButton.init(type: .custom)
        rightBtn.setTitle("结算", for: .normal)
        rightBtn.titleLabel?.font = customFont(font: 13)
//        rightBtn.backgroundColor = UIColor.init(named:"")
        
        let priceLabel = UILabel()
        priceLabel.text = "合计：19，9"
        priceLabel.font = customFont(font: 15)
        bottom.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { (make) in
            
        }
        
    }
}
