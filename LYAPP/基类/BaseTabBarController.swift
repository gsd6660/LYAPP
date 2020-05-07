//
//  BaseTabBarController.swift
//  LYAPP
//
//  Created by 科技 on 2020/5/7.
//  Copyright © 2020 科技. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    var indexFlag = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addControllers()
    }
    
    private func addControllers(){
        addChildCpmtrollers(HomeViewController(), title: "首页", image: "jft_but_home_normal", selectImage: "jft_but_home")
        addChildCpmtrollers(MallViewController(), title: "商城", image: "jft_but_shoppingmall_normal", selectImage: "jft_but_shoppingmall")
        addChildCpmtrollers(CartViewController(), title: "购物车", image: "jft_but_shoppingcart_normal", selectImage: "jft_but_shoppingcart")
        addChildCpmtrollers(MineViewController(), title: "我的", image: "jft_but_me_normal", selectImage: "jft_but_me")
    }
    
    private func addChildCpmtrollers(_ childVC: UIViewController,title: String, image:String, selectImage:String){
        childVC.tabBarItem.title = title;
        childVC.tabBarItem.image = UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
        childVC.tabBarItem.selectedImage = UIImage.init(named: selectImage)?.withRenderingMode(.alwaysOriginal)
        //选中文字
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : GreenColor], for: .selected)
        
        // 头部导航
        let nav = UINavigationController()
        nav.addChild(childVC)
        addChild(nav)
    }
    
    //点击item方法
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        if let index = tabBar.items?.firstIndex(of: item)
//        {
//            if indexFlag != index{
//                animationWithIndex(index: index-1)
//            }
//        }
//    }
    
    private func animationWithIndex(index : Int){
        var arrViews = [UIView]()
        //遍历tabbar子视图拿到可点击的item加入到数组
        for tabbarButton in tabBar.subviews {
            if tabbarButton.isKind(of: NSClassFromString("UITabBarButton")!){
                arrViews.append(tabbarButton)
            }
        }
        //缩放动画
        let pulse = CABasicAnimation(keyPath: "transform.scale")
        //动画函数
        pulse.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        //动画执行的时间
        pulse.duration = 0.1
        //动画执行的次数
        pulse.repeatCount = 1
        //动画执行完复位
        pulse.autoreverses = true
        //开始动画缩小的倍数
        pulse.fromValue = NSNumber(value: 0.7)
        //放大的倍数
        pulse.toValue = NSNumber(value: 1.1)
        //添加到item上
        arrViews[index].layer.add(pulse, forKey: nil)
        indexFlag = index
    }
    
}
