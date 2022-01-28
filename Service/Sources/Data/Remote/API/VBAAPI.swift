//
//  VBAAPI.swift
//  Service
//
//  Created by 최형우 on 2022/01/28.
//

import Moya
import Foundation

public protocol VBAAPI: TargetType {
    var domain: APIDomain { get }
    var urlPath: String { get }
}

extension VBAAPI {
    public var baseURL: URL{
        return URL(string: "https://api.pexels.com")!
    }
    
    public var path: String{
        return domain.url + urlPath
    }
    
    public var task: Task{
        return .requestPlain
    }
    
    public var validationType: ValidationType{
        return .successCodes
    }
    
    public var headers: [String : String]?{
        return ["Content-Type": "application/json"]
    }
}

public enum APIDomain: String{
    case videos
}

extension APIDomain{
    var url: String{
        return "/\(self.rawValue)"
    }
}
