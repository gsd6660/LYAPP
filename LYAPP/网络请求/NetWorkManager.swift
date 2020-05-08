//
//  NetWorkManager.swift
//  LYAPP
//
//  Created by 科技 on 2020/5/8.
//  Copyright © 2020 科技. All rights reserved.
//

import UIKit
import Foundation
import HandyJSON
import Moya
import SwiftyJSON
import Alamofire
import MBProgressHUD

///超时时长
private var requestTimeOut : Double = 30
///成功数据的回调
typealias successCallBack = ((_ response:JSON)-> Void)
///失败回调
typealias failedCallBack = ((_ failed:String)->Void)
///网络错误的回调
typealias errorCallBack = () -> Void

private let myEndpointClosure = {(target:API)-> Endpoint in
    
    let url = target.baseURL.absoluteString + target.path
    var task = target.task
    
//    let additonalParameters = ["token":"888888"]
//    let defaultEncoding = URLEncoding.default
//    switch target.task {
//    case .requestPlain:
//        task = .requestParameters(parameters: additonalParameters, encoding: defaultEncoding)
//    case .requestParameters(var parameters,let encoding):
//        additonalParameters.forEach{parameters[$0.key] = $0.value}
//        task = .requestParameters(parameters: parameters, encoding: encoding)
//    default:
//        break
//    }
    
    var endpoint = Endpoint(
        url: url,
        sampleResponseClosure: { .networkResponse(200,target.sampleData)},
        method: target.method,
        task: task,
        httpHeaderFields:
        target.headers
    )
    
    requestTimeOut = 30
    
    return endpoint
}

///网络请求的设置

private let requestClosure = { (endpoint: Endpoint,done: MoyaProvider.RequestResultClosure) in
    do{
        var request = try endpoint.urlRequest()
        //设置请求时长
        request.timeoutInterval = requestTimeOut
        //打印请求参数
        if let requestData = request.httpBody{
            print("\(request.url!)"+"\n"+"\(request.httpMethod ?? "")" + "发送参数"+"\(String(data: request.httpBody!, encoding: String.Encoding.utf8) ?? "")")
        }else{
            print("\(request.url!)"+"\(String(describing: request.httpMethod))")
        }
        done(.success(request))
        
    }catch{
        done(.failure(MoyaError.underlying(error, nil)))
    }
    
}

private let networkPlugin = NetworkActivityPlugin.init { (changeType, _) in
    print("networkPlugin\(changeType)")
    guard let vc = topVC else{return}
    switch changeType{
    case .began:
        print("开始请求网络")
//        MBProgressHUD.hide(for: vc.view, animated: false)
//        MBProgressHUD.showAdded(to: vc.view, animated: true)
    case .ended:
        print("结束")
//        MBProgressHUD.hide(for: vc.view, animated: false)
    }
}

///网络请求发送的核心初始化方法，创建网络请求对象

let Provider = MoyaProvider<API>(endpointClosure: myEndpointClosure, requestClosure: requestClosure, plugins: [networkPlugin])


/// 最常用的网络请求，只需知道正确的结果无需其他操作时候用这个

func NetWorkRequest(_ target: API,completion: @escaping successCallBack){
     
}

///  需要知道成功、失败、错误情况回调的网络请求   像结束下拉刷新各种情况都要判断
/// - Parameters:
///   - target: 网络请求
///   - completion: 成功
///   - failed: 失败
///   - error: 错误
@discardableResult
func NetWorkRequest(_ target:API,completion: @escaping successCallBack,failed: failedCallBack?)->Cancellable?{
    if !UIDevice.isNetworkConnect {
        print("提示用户网络似乎出现了问题")
        return nil
    }
    
    // 这里显示loading图
    
    return Provider.request(target) { (result) in
        // 隐藏hud
        switch result{
        case let .success(response):
                let jsonData = JSON(response.data)
                completion(jsonData)
        case let .failure(error):
            //网络j连接失败，提示用户
            print("网络连接失败\(error)")
        }
    }
}




extension UIDevice{
    static var isNetworkConnect:Bool{
        let network = NetworkReachabilityManager()
        return network?.isReachable ?? true
    }
}
