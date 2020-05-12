//
//  MallViewController.swift
//  LYAPP
//
//  Created by 科技 on 2020/5/7.
//  Copyright © 2020 科技. All rights reserved.
//

import UIKit
import SnapKitExtend
import SnapKit
class MallViewController: BaseViewController {

    let CellID = "MallTableViewCell"
    var parDic = [String:Any]()
    lazy var dataArray = [Dictionary<String, Any>]()
    override func viewDidLoad() {
        super.viewDidLoad()

        addButtons()
        self.view.addSubview(self.tableView)
        loadData()
    }
    
    
    private lazy var tableView:UITableView={
        let tab = UITableView.init(frame: CGRect.init(x: 0, y: kNavigationBarH+45, width: kScreenW, height: kScreenH - 45 - kNavigationBarH))
        tab.delegate = self
        tab.dataSource = self
        tab.separatorStyle = .none
        tab.register(UINib.init(nibName: CellID, bundle: nil), forCellReuseIdentifier: CellID)
        tab.backgroundColor = .clear
        return tab
    }()
    
    func addButtons(){
        let topView = UIView()
        topView.backgroundColor = .white
        self.view.addSubview(topView)
        topView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(kNavigationBarH)
            make.height.equalTo(40)
        }
        var array :Array<UIButton> = []
        let titles = ["分类","综合","最新","热销"]
        for (index,item) in titles.enumerated(){
            let btn = UIButton.init(type: .custom)
            btn.frame = .zero
            btn.setTitle(item, for: .normal)
            btn.backgroundColor = .white
            btn.setTitleColor(.black, for: .normal)
            btn.tag = 1000+index
            btn.titleLabel?.font = customFont(font: 15)
            if index == 0 {
                btn .setImage(UIImage.init(named: "jft_icon_downarrow"), for: .normal)
                btn.imagePosition(at:.right,space:10)
            }
            array.append(btn)
            btn.addTarget(self, action: #selector(topBtnClick(btn:)), for: .touchUpInside)
            topView.addSubview(btn)
        }
       array.snp.distributeViewsAlong(axisType: .horizontal, fixedItemLength: (kScreenW - 20)/4, leadSpacing: 10, tailSpacing: 10)
       array.snp.makeConstraints{
            $0.top.equalTo(10)
            $0.height.equalTo(30)
        }
    }

    
 

}

extension MallViewController{
    
    func loadData(){
        NetWorkRequest(.GoodsList(parameters: self.parDic)) { (respone) in
            if respone["code"] == 1{
              
                let datas = respone["data"]["list"]["data"].arrayObject
                self.dataArray = datas as! [Dictionary<String, Any>]
                self.tableView.reloadData()
            }
            print(respone)
        }
    }
    
    
    @objc func topBtnClick(btn:UIButton){
        let tag = btn.tag
        switch tag {
        case 1000:
//            self.parDic.updateValue(<#T##value: Any##Any#>, forKey: <#T##String#>)
            break
        case 1001:
            self.parDic.updateValue("all", forKey: "sprtType")
        case 1002:
            self.parDic.updateValue("new", forKey: "sortType")
        case 1003:
            self.parDic.updateValue("hot", forKey: "sortType")
        
        default:
            break
        }
        self.loadData()
    }
}

extension MallViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : MallTableViewCell = tableView.dequeueReusableCell(withIdentifier: CellID) as! MallTableViewCell
        if dataArray.count>0{
            cell.setDataDic(dataDic: dataArray[indexPath.row] )
        }
        return cell
    }
    
    
}
