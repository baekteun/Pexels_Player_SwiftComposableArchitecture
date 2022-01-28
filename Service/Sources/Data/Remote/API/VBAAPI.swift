//
//  VBAAPI.swift
//  Service
//
//  Created by 최형우 on 2022/01/28.
//

import Moya
import Foundation

protocol VBAAPI: TargetType {
    var domain: APIDomain { get }
    var urlPath: String { get }
}

extension VBAAPI {
    var baseURL: URL{
        return URL(string: "https://api.pexels.com")!
    }
    
    var path: String{
        return domain.url + urlPath
    }
    
    var task: Task{
        return .requestPlain
    }
    
    var validationType: ValidationType{
        return .successCodes
    }
    
    var headers: [String : String]?{
        return ["Content-Type": "application/json"]
    }
}

enum APIDomain: String{
    case videos
}

extension APIDomain{
    var url: String{
        return "/\(self.rawValue)"
    }
}
