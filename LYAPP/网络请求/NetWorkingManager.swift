//
//  NetWorkingManager.swift
//  LYAPP
//
//  Created by 科技 on 2020/5/7.
//  Copyright © 2020 科技. All rights reserved.
//

import UIKit

import Alamofire


typealias ResponseSuccess = (_ response: String) -> Void
typealias ResponseFail = (_ error: String) -> Void
typealias ResponseStatus = (_ NeteorkStatus: Int32) -> Void
typealias ResponseBlock = (_ progress: Int32) -> Void

@objc enum NetworkStatus: Int32{
    case unknown = -1
    case notReachable = 0
    case wwan = 1
    case wifi = 2
}



class NetWorkingManager: NSObject {
    
    static let share = NetWorkingManager()
    private var sessionManager : SessionManager?
    override init() {
        super.init()
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60
        sessionManager = SessionManager.init(configuration: configuration, delegate: SessionDelegate.init(), serverTrustPolicyManager: nil)
    }
    
    private var netWorkStatus:NetworkStatus = NetworkStatus.wifi
    
    public func getWith(url:String , params:[String : Any]?,success: @escaping ResponseSuccess,error: @escaping ResponseFail){
        
    }
    
    
    public func requestWith(url: String,httpMethod: Int32,params:[String:Any]?, success: @escaping ResponseSuccess , error: @escaping ResponseFail){
        if httpMethod == 0 {
            
        }
    }
}
