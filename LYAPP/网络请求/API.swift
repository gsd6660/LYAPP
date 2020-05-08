//
//  API.swift
//  LYAPP
//
//  Created by 科技 on 2020/5/8.
//  Copyright © 2020 科技. All rights reserved.
//

import UIKit
import Moya
 
enum API {
    //登录
    case Login(parameters:[String:Any])
    //注册
    case Register(parameters:[String:Any])
    //首页
    case Home
    //上传图片
    case uploadImage(parameters:[String:Any],imageData:Data)
    //首页商品
    case HomeGoods
    
}

extension API : TargetType{
    var baseURL: URL {
         return URL.init(string: BaseURL)!
       
    }
    
    var path: String {
        switch self {
        case .Login:
            return "login"
        case .Register:
            return "register"
        case .Home:
            return "api/index/index"
        case .uploadImage:
            return ""
        case .HomeGoods:
            return "api/index/recommend"
        }
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        switch self {
        case let .Login(parameters):
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
         
        case .Register(let parameters):
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        case .Home,.HomeGoods:
            return .requestPlain
        case .uploadImage(let parameters,let imageData):
            let formData = MultipartFormData(provider: .data(imageData), name: "iFile", fileName: "iFile", mimeType: "image/png")
            
            return .uploadCompositeMultipart([formData], urlParameters: parameters)
        
            
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type":"application/x-www-form-urlencoded"]
    }
    
    
}
