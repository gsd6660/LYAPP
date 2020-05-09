//
//  Common.swift
//  TodayNews
//
//  Created by 科技 on 2020/4/30.
//  Copyright © 2020 科技. All rights reserved.
//

import UIKit
//屏幕宽高
let kScreenW = UIScreen.main.bounds.width
let kScreenH = UIScreen.main.bounds.height

//keyWindow
let KeyWindow = UIApplication.shared.keyWindow


let kIsIphone = Bool(UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiom.phone)

let kIsIphoneX = Bool(kScreenW >= 375.0 && kScreenH >= 812.0 && kIsIphone)

let kNavigationBarH = CGFloat(kIsIphoneX ? 88 : 64)

let kStatusBarH = CGFloat(kIsIphoneX ? 44 : 20)

let kTabBarH = CGFloat(kIsIphoneX ? (49+34) : 49)


func RGBColor(r:CGFloat,g:CGFloat,b:CGFloat)->UIColor{
    return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
}

//翠绿色
let GreenColor = RGBColor(r: 58, g: 205, b: 123)
 
//灰色
let GaryColor = RGBColor(r: 191, g: 191, b: 191)

let BGColor = RGBColor(r: 245, g: 245, b: 245)
 

//字号
func customFont(font :CGFloat)->UIFont{
    //刘海
    guard kScreenH <= 736 else {
        return UIFont.systemFont(ofSize: font)
    }
    //5.5
    guard kScreenH <= 736 else {
        return UIFont.systemFont(ofSize: font-2)
    }
    // 4.7
    guard kScreenH <= 736 else {
        return UIFont.systemFont(ofSize: font-4)
    }
    return UIFont.systemFont(ofSize: font)
}


var topVC: UIViewController? {
    var resultVC: UIViewController?
    resultVC = _topVC(UIApplication.shared.keyWindow?.rootViewController)
    while resultVC?.presentedViewController != nil {
        resultVC = _topVC(resultVC?.presentedViewController)
    }
    return resultVC
}

private  func _topVC(_ vc: UIViewController?) -> UIViewController? {
    if vc is UINavigationController {
        return _topVC((vc as? UINavigationController)?.topViewController)
    } else if vc is UITabBarController {
        return _topVC((vc as? UITabBarController)?.selectedViewController)
    } else {
        return vc
    }
}

